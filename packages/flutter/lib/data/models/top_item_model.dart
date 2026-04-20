import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/mvp_entities.dart';

part 'top_item_model.freezed.dart';
part 'top_item_model.g.dart';

@freezed
abstract class TopItemModel with _$TopItemModel {
  const TopItemModel._();

  const factory TopItemModel({
    required int menuItemId,
    required String name,
    required int qtySold,
  }) = _TopItemModel;

  factory TopItemModel.fromJson(Map<String, dynamic> json) =>
      _$TopItemModelFromJson(json);

  TopItemEntity toEntity() =>
      TopItemEntity(menuItemId: menuItemId, name: name, qtySold: qtySold);
}
