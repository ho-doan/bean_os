// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_order_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PosOrderItemModel _$PosOrderItemModelFromJson(Map<String, dynamic> json) =>
    _PosOrderItemModel(
      menuItemId: (json['menuItemId'] as num).toInt(),
      qty: (json['qty'] as num).toInt(),
      note: json['note'] as String?,
      menuItem: json['menuItem'] == null
          ? null
          : PosMenuItemModel.fromJson(json['menuItem'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PosOrderItemModelToJson(_PosOrderItemModel instance) =>
    <String, dynamic>{
      'menuItemId': instance.menuItemId,
      'qty': instance.qty,
      'note': instance.note,
      'menuItem': instance.menuItem,
    };
