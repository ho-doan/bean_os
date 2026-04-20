// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_table_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PosTableModel _$PosTableModelFromJson(Map<String, dynamic> json) =>
    _PosTableModel(
      id: (json['id'] as num).toInt(),
      label: json['label'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$PosTableModelToJson(_PosTableModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'status': instance.status,
    };
