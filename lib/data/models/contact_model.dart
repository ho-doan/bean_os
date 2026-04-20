import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/contact_entity.dart';

part 'contact_model.freezed.dart';
part 'contact_model.g.dart';

@freezed
abstract class ContactModel with _$ContactModel {
  const ContactModel._();

  const factory ContactModel({
    required String id,
    required String name,
  }) = _ContactModel;

  factory ContactModel.fromJson(Map<String, dynamic> json) =>
      _$ContactModelFromJson(json);

  ContactEntity toEntity() => ContactEntity(id: id, name: name);
}
