// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_menu_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PosMenuItemOptionModel _$PosMenuItemOptionModelFromJson(
  Map<String, dynamic> json,
) => _PosMenuItemOptionModel(
  key: json['key'] as String,
  label: json['label'] as String,
  values: (json['values'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$PosMenuItemOptionModelToJson(
  _PosMenuItemOptionModel instance,
) => <String, dynamic>{
  'key': instance.key,
  'label': instance.label,
  'values': instance.values,
};

_PosMenuItemModel _$PosMenuItemModelFromJson(Map<String, dynamic> json) =>
    _PosMenuItemModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      isAvailable: json['isAvailable'] as bool? ?? true,
      description: json['description'] as String?,
      options: (json['options'] as List<dynamic>?)
          ?.map(
            (e) => PosMenuItemOptionModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$PosMenuItemModelToJson(_PosMenuItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'isAvailable': instance.isAvailable,
      'description': instance.description,
      'options': instance.options,
    };
