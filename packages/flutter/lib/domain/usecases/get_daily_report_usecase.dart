import 'package:injectable/injectable.dart';

import '../entities/mvp_entities.dart';
import '../repositories/pos_repository.dart';

@lazySingleton
class GetDailyReportUseCase {
  GetDailyReportUseCase(this._repository);

  final PosRepository _repository;

  Future<DailyReportEntity> call(String date) => _repository.getDailyReport(date);
}
