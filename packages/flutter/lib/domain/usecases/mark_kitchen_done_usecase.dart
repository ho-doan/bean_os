import 'package:injectable/injectable.dart';

import '../entities/mvp_entities.dart';
import '../repositories/pos_repository.dart';

@lazySingleton
class MarkKitchenDoneUseCase {
  MarkKitchenDoneUseCase(this._repository);

  final PosRepository _repository;

  Future<OrderEntity> call(int orderId) => _repository.markKitchenDone(orderId);
}
