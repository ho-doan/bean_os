import 'package:injectable/injectable.dart';

import '../entities/mvp_entities.dart';
import '../repositories/pos_repository.dart';

@lazySingleton
class CreateOrderUseCase {
  CreateOrderUseCase(this._repository);

  final PosRepository _repository;

  Future<OrderEntity> call({
    required int tableId,
    required List<CreateOrderLineInput> items,
  }) => _repository.createOrder(tableId: tableId, items: items);
}
