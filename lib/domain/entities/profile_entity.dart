import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  const ProfileEntity({
    required this.id,
    required this.name,
    this.bio,
  });

  final String id;
  final String name;
  final String? bio;

  @override
  List<Object?> get props => [id, name, bio];
}
