import 'package:injectable/injectable.dart';

import '../../domain/entities/mvp_entities.dart';
import '../../domain/repositories/pos_repository.dart';
import '../datasources/app_local_data_source.dart';
import '../datasources/pos_remote_data_source.dart';

@LazySingleton(as: PosRepository)
class PosRepositoryImpl implements PosRepository {
  PosRepositoryImpl(this._remote, this._local);

  final PosRemoteDataSource _remote;
  final AppLocalDataSource _local;

  @override
  Future<List<TableEntity>> getTables() async {
    final rows = await _remote.getTables();
    return rows.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<MenuItemEntity>> getMenu() async {
    final rows = await _remote.getMenu();
    return rows.map((e) => e.toEntity()).toList();
  }

  @override
  Future<OrderEntity> createOrder({
    required int tableId,
    required List<CreateOrderLineInput> items,
  }) async {
    final order = await _remote.createOrder(
      tableId: tableId,
      items: items
          .map(
            (e) => {
              'menuItemId': e.menuItemId,
              'qty': e.qty,
              if (e.note != null && e.note!.isNotEmpty) 'note': e.note,
            },
          )
          .toList(),
    );
    return order.toEntity();
  }

  @override
  Future<List<OrderEntity>> getKitchenQueue() async {
    try {
      final rows = await _remote.getKitchenQueue();
      try {
        await _local.replaceKitchenQueue(rows);
      } catch (_) {
        // Cache best-effort.
      }
      return rows.map((e) => e.toEntity()).toList();
    } catch (_) {
      final cached = await _local.readKitchenQueue();
      if (cached != null) {
        return cached.map((e) => e.toEntity()).toList();
      }
      rethrow;
    }
  }

  @override
  Future<OrderEntity> markKitchenDone(int orderId) async {
    final row = await _remote.markKitchenDone(orderId);
    return row.toEntity();
  }

  @override
  Future<List<OrderEntity>> getActiveOrders() async {
    try {
      final rows = await _remote.getActiveOrders();
      try {
        await _local.replaceActiveOrders(rows);
      } catch (_) {
        // Cache best-effort.
      }
      return rows.map((e) => e.toEntity()).toList();
    } catch (_) {
      final cached = await _local.readActiveOrders();
      if (cached != null) {
        return cached.map((e) => e.toEntity()).toList();
      }
      rethrow;
    }
  }

  @override
  Future<PaymentResultEntity> createPayment({
    required int orderId,
    required String method,
    required double amount,
  }) async {
    final row = await _remote.createPayment(
      orderId: orderId,
      method: method,
      amount: amount,
    );
    return row.toEntity();
  }

  @override
  Future<void> voidPayment(int paymentId) async {
    await _remote.voidPayment(paymentId);
  }

  @override
  Future<DailyReportEntity> getDailyReport(String date) async {
    final row = await _remote.getDailyReport(date);
    return row.toEntity();
  }

  @override
  Future<List<TopItemEntity>> getTopItems({
    required String date,
    int limit = 20,
  }) async {
    final rows = await _remote.getTopItems(date: date, limit: limit);
    return rows.map((e) => e.toEntity()).toList();
  }
}
