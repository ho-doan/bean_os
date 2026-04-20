import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/mvp_entities.dart';

part 'payment_result_model.freezed.dart';
part 'payment_result_model.g.dart';

@freezed
abstract class PaymentModel with _$PaymentModel {
  const factory PaymentModel({required int id}) = _PaymentModel;

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);
}

@freezed
abstract class PaymentResultModel with _$PaymentResultModel {
  const PaymentResultModel._();

  const factory PaymentResultModel({
    required PaymentModel payment,
    required double orderTotal,
    required double changeAmount,
  }) = _PaymentResultModel;

  factory PaymentResultModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentResultModelFromJson(json);

  PaymentResultEntity toEntity() => PaymentResultEntity(
    paymentId: payment.id,
    orderTotal: orderTotal,
    changeAmount: changeAmount,
  );
}
