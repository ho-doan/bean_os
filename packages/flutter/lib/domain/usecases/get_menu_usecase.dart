import 'package:injectable/injectable.dart';

import '../entities/mvp_entities.dart';
import '../repositories/pos_repository.dart';

@lazySingleton
class GetMenuUseCase {
  GetMenuUseCase(this._repository);

  final PosRepository _repository;

  Future<List<MenuItemEntity>> call() => _repository.getMenu();
}
