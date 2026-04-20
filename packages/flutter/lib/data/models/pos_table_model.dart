import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/mvp_entities.dart';

part 'pos_table_model.freezed.dart';
part 'pos_table_model.g.dart';

@freezed
abstract class PosTableModel with _$PosTableModel {
  const PosTableModel._();

  const factory PosTableModel({
    required int id,
    required String label,
    required String status,
  }) = _PosTableModel;

  factory PosTableModel.fromJson(Map<String, dynamic> json) =>
      _$PosTableModelFromJson(json);

  TableEntity toEntity() => TableEntity(id: id, label: label, status: status);
}
