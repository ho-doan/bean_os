import 'package:injectable/injectable.dart';

import '../repositories/pos_repository.dart';

@lazySingleton
class VoidPaymentUseCase {
  VoidPaymentUseCase(this._repository);

  final PosRepository _repository;

  Future<void> call(int paymentId) => _repository.voidPayment(paymentId);
}
