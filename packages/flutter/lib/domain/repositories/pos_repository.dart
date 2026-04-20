import '../entities/mvp_entities.dart';

class CreateOrderLineInput {
  const CreateOrderLineInput({required this.menuItemId, required this.qty, this.note});
  final int menuItemId;
  final int qty;
  final String? note;
}

abstract class PosRepository {
  Future<List<TableEntity>> getTables();
  Future<List<MenuItemEntity>> getMenu();
  Future<OrderEntity> createOrder({required int tableId, required List<CreateOrderLineInput> items});
  Future<List<OrderEntity>> getKitchenQueue();
  Future<OrderEntity> markKitchenDone(int orderId);
  Future<List<OrderEntity>> getActiveOrders();
  Future<PaymentResultEntity> createPayment({required int orderId, required String method, required double amount});
  Future<void> voidPayment(int paymentId);
  Future<DailyReportEntity> getDailyReport(String date);
  Future<List<TopItemEntity>> getTopItems({required String date, int limit = 20});
}
