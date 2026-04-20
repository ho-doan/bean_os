// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) =>
    _PaymentModel(id: (json['id'] as num).toInt());

Map<String, dynamic> _$PaymentModelToJson(_PaymentModel instance) =>
    <String, dynamic>{'id': instance.id};

_PaymentResultModel _$PaymentResultModelFromJson(Map<String, dynamic> json) =>
    _PaymentResultModel(
      payment: PaymentModel.fromJson(json['payment'] as Map<String, dynamic>),
      orderTotal: (json['orderTotal'] as num).toDouble(),
      changeAmount: (json['changeAmount'] as num).toDouble(),
    );

Map<String, dynamic> _$PaymentResultModelToJson(_PaymentResultModel instance) =>
    <String, dynamic>{
      'payment': instance.payment,
      'orderTotal': instance.orderTotal,
      'changeAmount': instance.changeAmount,
    };
