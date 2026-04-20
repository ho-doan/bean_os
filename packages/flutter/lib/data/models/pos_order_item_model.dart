import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/mvp_entities.dart';
import 'pos_menu_item_model.dart';

part 'pos_order_item_model.freezed.dart';
part 'pos_order_item_model.g.dart';

@freezed
abstract class PosOrderItemModel with _$PosOrderItemModel {
  const PosOrderItemModel._();

  const factory PosOrderItemModel({
    required int menuItemId,
    required int qty,
    String? note,
    PosMenuItemModel? menuItem,
  }) = _PosOrderItemModel;

  factory PosOrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$PosOrderItemModelFromJson(json);

  OrderLineEntity toEntity() => OrderLineEntity(
    menuItemId: menuItemId,
    qty: qty,
    note: note,
    menuName: menuItem?.name,
    unitPrice: menuItem?.price,
  );
}
