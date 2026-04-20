// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_menu_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PosMenuItemModel _$PosMenuItemModelFromJson(Map<String, dynamic> json) =>
    _PosMenuItemModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      isAvailable: json['isAvailable'] as bool? ?? true,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$PosMenuItemModelToJson(_PosMenuItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'isAvailable': instance.isAvailable,
      'description': instance.description,
    };
