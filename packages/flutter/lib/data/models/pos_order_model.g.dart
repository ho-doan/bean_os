// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PosOrderModel _$PosOrderModelFromJson(Map<String, dynamic> json) =>
    _PosOrderModel(
      id: (json['id'] as num).toInt(),
      tableId: (json['tableId'] as num).toInt(),
      status: json['status'] as String,
      items:
          (json['items'] as List<dynamic>?)
              ?.map(
                (e) => PosOrderItemModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <PosOrderItemModel>[],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$PosOrderModelToJson(_PosOrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tableId': instance.tableId,
      'status': instance.status,
      'items': instance.items,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
