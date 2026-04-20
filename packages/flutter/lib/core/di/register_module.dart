import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../data/api/app_api.dart';
import '../../data/datasources/app_dio.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => createAppDio();

  @lazySingleton
  AppApi appApi(Dio dio) => AppApi(dio, baseUrl: AppApi.base);
}
