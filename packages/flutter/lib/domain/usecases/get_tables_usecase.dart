import 'package:injectable/injectable.dart';

import '../entities/mvp_entities.dart';
import '../repositories/pos_repository.dart';

@lazySingleton
class GetTablesUseCase {
  GetTablesUseCase(this._repository);

  final PosRepository _repository;

  Future<List<TableEntity>> call() => _repository.getTables();
}
