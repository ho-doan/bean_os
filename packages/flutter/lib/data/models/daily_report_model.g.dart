// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyReportModel _$DailyReportModelFromJson(Map<String, dynamic> json) =>
    _DailyReportModel(
      date: json['date'] as String,
      totalRevenue: (json['totalRevenue'] as num).toDouble(),
      orderCount: (json['orderCount'] as num).toInt(),
    );

Map<String, dynamic> _$DailyReportModelToJson(_DailyReportModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'totalRevenue': instance.totalRevenue,
      'orderCount': instance.orderCount,
    };
