import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/mvp_entities.dart';

part 'pos_menu_item_model.freezed.dart';
part 'pos_menu_item_model.g.dart';

@freezed
abstract class PosMenuItemOptionModel with _$PosMenuItemOptionModel {
  const PosMenuItemOptionModel._();

  const factory PosMenuItemOptionModel({
    required String key,
    required String label,
    required List<String> values,
  }) = _PosMenuItemOptionModel;

  factory PosMenuItemOptionModel.fromJson(Map<String, dynamic> json) =>
      _$PosMenuItemOptionModelFromJson(json);

  MenuItemOptionEntity toEntity() =>
      MenuItemOptionEntity(key: key, label: label, values: values);
}

@freezed
abstract class PosMenuItemModel with _$PosMenuItemModel {
  const PosMenuItemModel._();

  const factory PosMenuItemModel({
    required int id,
    required String name,
    required double price,
    @Default(true) bool isAvailable,
    String? description,
    List<PosMenuItemOptionModel>? options,
  }) = _PosMenuItemModel;

  factory PosMenuItemModel.fromJson(Map<String, dynamic> json) =>
      _$PosMenuItemModelFromJson(json);

  MenuItemEntity toEntity() => MenuItemEntity(
    id: id,
    name: name,
    price: price,
    isAvailable: isAvailable,
    description: description,
    options: options?.map((e) => e.toEntity()).toList(),
  );
}
