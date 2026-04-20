// Route JSON schema matches [dio_mock_interceptor](https://pub.dev/packages/dio_mock_interceptor).
// This loader reads explicit asset paths so widget tests work without AssetManifest.json.

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:template_expressions/template_expressions.dart';

/// Loads mock routes from JSON files under `assets/api_mocks/`.
class AssetApiMocksInterceptor extends Interceptor {
  AssetApiMocksInterceptor({List<String>? routeAssetPaths})
    : _routeAssetPaths = routeAssetPaths ?? _defaultRouteAssets {
    _futureRoutesLoaded = _loadRoutes();
  }

  static const List<String> _defaultRouteAssets = <String>[
    'assets/api_mocks/chats.json',
    'assets/api_mocks/contacts.json',
    'assets/api_mocks/profile.json',
    'assets/api_mocks/contact_detail.json',
    'assets/api_mocks/chat_detail.json',
  ];

  final List<String> _routeAssetPaths;
  late final Future<void> _futureRoutesLoaded;
  final Map<String, Map<String, dynamic>> _routes = {};
  final RegExp _regexpTemplate = RegExp(r'"\$\{template\}"');
  static const StandardExpressionSyntax _exSyntax = StandardExpressionSyntax();

  Future<void> _loadRoutes() async {
    for (final assetPath in _routeAssetPaths) {
      final routeModule = await rootBundle.loadString(assetPath);
      final decoded = json.decode(routeModule) as List<dynamic>;
      for (final map in decoded) {
        final route = map as Map<String, dynamic>;
        final path = route['path'] as String;
        _routes.putIfAbsent(path, () => route);
      }
    }
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    await _futureRoutesLoaded;

    final route = _routes[options.path];

    if (route == null) {
      handler.reject(
        DioException(
          requestOptions: options,
          error: "Can't find route setting: ${options.path}",
        ),
      );
      return;
    }

    final method = route['method'] as String;
    if (options.method != method) {
      handler.reject(
        DioException(
          requestOptions: options,
          error:
              "Can't find route setting: ${options.path}:${options.method}",
        ),
      );
      return;
    }

    final statusCode = route['statusCode'] as int;

    final template = route['template'] as Map<String, dynamic>?;
    final data = route['data'];

    if (template == null && data == null) {
      handler.resolve(
        Response(requestOptions: options, statusCode: statusCode),
      );
      return;
    }

    final vars = route['vars'] as Map<String, dynamic>?;
    var exContext = vars ?? <String, dynamic>{};

    exContext.putIfAbsent(
      'req',
      () => <String, dynamic>{
        'headers': options.headers,
        'queryParameters': options.queryParameters,
        'baseUrl': options.baseUrl,
        'method': options.method,
        'path': options.path,
      },
    );

    if (options.data != null) {
      if (options.data is Map) {
        exContext.update('req', (value) {
          (value as Map<String, dynamic>)['data'] = options.data;
          return value;
        });
      }
      if (options.data is FormData) {
        final fields = (options.data as FormData).fields;
        exContext.update('req', (value) {
          (value as Map<String, dynamic>)['data'] = {
            for (final e in fields) e.key: e.value,
          };
          return value;
        });
      }
    }

    if (template != null && data == null) {
      var resData = _templateData(template, exContext);
      if (vars != null && vars.isNotEmpty) {
        resData = _replaceVarObjs(resData, vars);
      }

      resData = Template(
        syntax: [_exSyntax],
        value: resData,
      ).process(context: exContext);

      handler.resolve(
        Response(
          data: _decodeJsonBody(resData),
          requestOptions: options,
          statusCode: statusCode,
        ),
      );
      return;
    }

    var resData = json.encode(data);

    if (template != null) {
      final tData = _templateData(template, exContext);
      resData = resData.replaceAll(_regexpTemplate, tData);
    }

    final templates = route['templates'] as Map<String, dynamic>?;
    if (templates != null && templates.isNotEmpty) {
      for (final entry in templates.entries) {
        final tpl = entry.value as Map<String, dynamic>;
        final tData = _templateData(tpl, exContext);
        final regexpTemplate = RegExp(
          r'"\$\{templates\.' '${entry.key}' r'}"',
        );
        resData = resData.replaceAll(regexpTemplate, tData);
      }
    }

    if (vars != null && vars.isNotEmpty) {
      resData = _replaceVarObjs(resData, vars);
    }

    resData = Template(
      syntax: [_exSyntax],
      value: resData,
    ).process(context: exContext);

    handler.resolve(
      Response(
        data: _decodeJsonBody(resData),
        requestOptions: options,
        statusCode: statusCode,
      ),
    );
  }

  /// Mock package yields a JSON string; decode so Dio/Retrofit see Map/List.
  dynamic _decodeJsonBody(String resData) {
    try {
      return jsonDecode(resData);
    } catch (_) {
      return resData;
    }
  }

  String _replaceVarObjs(String resData, Map<String, dynamic>? vars) {
    if (vars == null || vars.isEmpty) {
      return resData;
    }
    for (final element in vars.entries) {
      final vKey = element.key;
      final vValue = element.value;
      if (vValue is Iterable || vValue is Map) {
        resData = resData.replaceAll(
          RegExp(r'"\$\{' + vKey + r'\}"'),
          json.encode(vValue),
        );
      }
    }
    return resData;
  }

  String _templateData(
    Map<String, dynamic> template,
    Map<String, dynamic> exContext,
  ) {
    final content = template['content'];
    if (content == null) {
      return '{}';
    }

    final size = template['size'] as int?;
    final sContent = json.encode(content);

    final exTemplate = Template(
      syntax: [_exSyntax],
      value: sContent,
    );

    if (size == null) {
      exContext.putIfAbsent('index', () => 0);
      return exTemplate.process(context: exContext);
    }

    final joinString = List.generate(size, (index) {
      exContext.addAll({'index': index});
      return exTemplate.process(context: exContext);
    }).join(',');
    return '[$joinString]';
  }
}
