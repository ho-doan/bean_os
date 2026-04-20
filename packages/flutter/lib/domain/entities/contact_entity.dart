import 'package:equatable/equatable.dart';

class ContactEntity extends Equatable {
  const ContactEntity({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  @override
  List<Object?> get props => [id, name];
}
