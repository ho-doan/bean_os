import 'package:injectable/injectable.dart';

import '../entities/mvp_entities.dart';
import '../repositories/pos_repository.dart';

@lazySingleton
class GetTopItemsUseCase {
  GetTopItemsUseCase(this._repository);

  final PosRepository _repository;

  Future<List<TopItemEntity>> call({required String date, int limit = 20}) =>
      _repository.getTopItems(date: date, limit: limit);
}
