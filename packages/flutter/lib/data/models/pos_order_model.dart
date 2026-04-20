import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/mvp_entities.dart';
import 'pos_order_item_model.dart';

part 'pos_order_model.freezed.dart';
part 'pos_order_model.g.dart';

@freezed
abstract class PosOrderModel with _$PosOrderModel {
  const PosOrderModel._();

  const factory PosOrderModel({
    required int id,
    required int tableId,
    required String status,
    @Default(<PosOrderItemModel>[]) List<PosOrderItemModel> items,
    DateTime? createdAt,
  }) = _PosOrderModel;

  factory PosOrderModel.fromJson(Map<String, dynamic> json) =>
      _$PosOrderModelFromJson(json);

  OrderEntity toEntity() => OrderEntity(
    id: id,
    tableId: tableId,
    status: status,
    items: items.map((e) => e.toEntity()).toList(),
    createdAt: createdAt,
  );
}
