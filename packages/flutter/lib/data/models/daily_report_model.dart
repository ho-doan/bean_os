import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/mvp_entities.dart';

part 'daily_report_model.freezed.dart';
part 'daily_report_model.g.dart';

@freezed
abstract class DailyReportModel with _$DailyReportModel {
  const DailyReportModel._();

  const factory DailyReportModel({
    required String date,
    required double totalRevenue,
    required int orderCount,
  }) = _DailyReportModel;

  factory DailyReportModel.fromJson(Map<String, dynamic> json) =>
      _$DailyReportModelFromJson(json);

  DailyReportEntity toEntity() => DailyReportEntity(
    date: date,
    totalRevenue: totalRevenue,
    orderCount: orderCount,
  );
}
