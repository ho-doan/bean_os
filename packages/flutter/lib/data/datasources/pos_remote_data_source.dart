import 'package:injectable/injectable.dart';

import '../api/pos_api.dart';
import '../models/daily_report_model.dart';
import '../models/payment_result_model.dart';
import '../models/pos_menu_item_model.dart';
import '../models/pos_order_model.dart';
import '../models/pos_table_model.dart';
import '../models/top_item_model.dart';

abstract class PosRemoteDataSource {
  Future<List<PosTableModel>> getTables();

  Future<List<PosMenuItemModel>> getMenu();

  Future<PosOrderModel> createOrder({
    required int tableId,
    required List<Map<String, dynamic>> items,
  });

  Future<List<PosOrderModel>> getKitchenQueue();

  Future<PosOrderModel> markKitchenDone(int orderId);

  Future<List<PosOrderModel>> getActiveOrders();

  Future<PaymentResultModel> createPayment({
    required int orderId,
    required String method,
    required double amount,
  });

  Future<void> voidPayment(int paymentId);

  Future<DailyReportModel> getDailyReport(String date);

  Future<List<TopItemModel>> getTopItems({
    required String date,
    required int limit,
  });
}

@LazySingleton(as: PosRemoteDataSource)
class PosRemoteDataSourceImpl implements PosRemoteDataSource {
  PosRemoteDataSourceImpl(this._api);

  final PosApi _api;

  @override
  Future<List<PosTableModel>> getTables() => _api.getTables();

  @override
  Future<List<PosMenuItemModel>> getMenu() => _api.getMenu();

  @override
  Future<PosOrderModel> createOrder({
    required int tableId,
    required List<Map<String, dynamic>> items,
  }) => _api.createOrder({'tableId': tableId, 'items': items});

  @override
  Future<List<PosOrderModel>> getKitchenQueue() => _api.getKitchenQueue();

  @override
  Future<PosOrderModel> markKitchenDone(int orderId) =>
      _api.markKitchenDone(orderId);

  @override
  Future<List<PosOrderModel>> getActiveOrders() => _api.getActiveOrders();

  @override
  Future<PaymentResultModel> createPayment({
    required int orderId,
    required String method,
    required double amount,
  }) => _api.createPayment({
    'orderId': orderId,
    'method': method,
    'amount': amount,
  });

  @override
  Future<void> voidPayment(int paymentId) => _api.voidPayment(paymentId);

  @override
  Future<DailyReportModel> getDailyReport(String date) =>
      _api.getDailyReport(date);

  @override
  Future<List<TopItemModel>> getTopItems({
    required String date,
    required int limit,
  }) => _api.getTopItems(date, limit);
}
