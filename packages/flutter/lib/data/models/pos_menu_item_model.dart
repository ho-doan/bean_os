import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/mvp_entities.dart';

part 'pos_menu_item_model.freezed.dart';
part 'pos_menu_item_model.g.dart';

@freezed
abstract class PosMenuItemModel with _$PosMenuItemModel {
  const PosMenuItemModel._();

  const factory PosMenuItemModel({
    required int id,
    required String name,
    required double price,
    @Default(true) bool isAvailable,
    String? description,
  }) = _PosMenuItemModel;

  factory PosMenuItemModel.fromJson(Map<String, dynamic> json) =>
      _$PosMenuItemModelFromJson(json);

  MenuItemEntity toEntity() => MenuItemEntity(
    id: id,
    name: name,
    price: price,
    isAvailable: isAvailable,
    description: description,
  );
}
