import 'package:injectable/injectable.dart';

import '../entities/mvp_entities.dart';
import '../repositories/pos_repository.dart';

@lazySingleton
class GetActiveOrdersUseCase {
  GetActiveOrdersUseCase(this._repository);

  final PosRepository _repository;

  Future<List<OrderEntity>> call() => _repository.getActiveOrders();
}
