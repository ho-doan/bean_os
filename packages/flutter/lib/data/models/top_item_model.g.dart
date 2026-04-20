// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TopItemModel _$TopItemModelFromJson(Map<String, dynamic> json) =>
    _TopItemModel(
      menuItemId: (json['menuItemId'] as num).toInt(),
      name: json['name'] as String,
      qtySold: (json['qtySold'] as num).toInt(),
    );

Map<String, dynamic> _$TopItemModelToJson(_TopItemModel instance) =>
    <String, dynamic>{
      'menuItemId': instance.menuItemId,
      'name': instance.name,
      'qtySold': instance.qtySold,
    };
