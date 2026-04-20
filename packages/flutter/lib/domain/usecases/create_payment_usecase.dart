import 'package:injectable/injectable.dart';

import '../entities/mvp_entities.dart';
import '../repositories/pos_repository.dart';

@lazySingleton
class CreatePaymentUseCase {
  CreatePaymentUseCase(this._repository);

  final PosRepository _repository;

  Future<PaymentResultEntity> call({
    required int orderId,
    required String method,
    required double amount,
  }) => _repository.createPayment(orderId: orderId, method: method, amount: amount);
}
