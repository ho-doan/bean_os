import 'package:equatable/equatable.dart';

class MenuItemOptionEntity extends Equatable {
  const MenuItemOptionEntity({
    required this.key,
    required this.label,
    required this.values,
  });

  final String key;
  final String label;
  final List<String> values;

  @override
  List<Object?> get props => [key, label, values];
}

class TableEntity extends Equatable {
  const TableEntity({required this.id, required this.label, required this.status});
  final int id;
  final String label;
  final String status;
  bool get isFree => status == 'free';
  @override
  List<Object?> get props => [id, label, status];
}

class MenuItemEntity extends Equatable {
  const MenuItemEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.isAvailable,
    this.description,
    this.options,
  });
  final int id;
  final String name;
  final double price;
  final bool isAvailable;
  final String? description;
  final List<MenuItemOptionEntity>? options;
  @override
  List<Object?> get props => [id, name, price, isAvailable, description, options];
}

class OrderLineEntity extends Equatable {
  const OrderLineEntity({
    required this.menuItemId,
    required this.qty,
    this.note,
    this.menuName,
    this.unitPrice,
  });
  final int menuItemId;
  final int qty;
  final String? note;
  final String? menuName;
  final double? unitPrice;
  @override
  List<Object?> get props => [menuItemId, qty, note, menuName, unitPrice];
}

class OrderEntity extends Equatable {
  const OrderEntity({
    required this.id,
    required this.tableId,
    required this.status,
    required this.items,
    this.createdAt,
  });
  final int id;
  final int tableId;
  final String status;
  final List<OrderLineEntity> items;
  final DateTime? createdAt;
  double get total => items.fold<double>(0, (sum, item) => sum + (item.unitPrice ?? 0) * item.qty);
  @override
  List<Object?> get props => [id, tableId, status, items, createdAt];
}

class PaymentResultEntity extends Equatable {
  const PaymentResultEntity({required this.paymentId, required this.orderTotal, required this.changeAmount});
  final int paymentId;
  final double orderTotal;
  final double changeAmount;
  @override
  List<Object?> get props => [paymentId, orderTotal, changeAmount];
}

class DailyReportEntity extends Equatable {
  const DailyReportEntity({required this.date, required this.totalRevenue, required this.orderCount});
  final String date;
  final double totalRevenue;
  final int orderCount;
  @override
  List<Object?> get props => [date, totalRevenue, orderCount];
}

class TopItemEntity extends Equatable {
  const TopItemEntity({required this.menuItemId, required this.name, required this.qtySold});
  final int menuItemId;
  final String name;
  final int qtySold;
  @override
  List<Object?> get props => [menuItemId, name, qtySold];
}
