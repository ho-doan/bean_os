import 'dart:async';
import 'dart:convert';

import 'package:example/core/env/env.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../core/di/injection.dart';
import '../../domain/entities/mvp_entities.dart';
import '../../domain/repositories/pos_repository.dart';
import '../../domain/usecases/create_order_usecase.dart';
import '../../domain/usecases/create_payment_usecase.dart';
import '../../domain/usecases/get_active_orders_usecase.dart';
import '../../domain/usecases/get_daily_report_usecase.dart';
import '../../domain/usecases/get_kitchen_queue_usecase.dart';
import '../../domain/usecases/get_menu_usecase.dart';
import '../../domain/usecases/get_tables_usecase.dart';
import '../../domain/usecases/get_top_items_usecase.dart';
import '../../domain/usecases/mark_kitchen_done_usecase.dart';

/// Cùng host/path với REST; `http`→`ws`, `https`→`wss` (hợp Flutter web / mobile).
Uri _kitchenWebSocketUri() {
  final u = Uri.parse(Env.apiUrl).resolve('/kitchen');
  final scheme = u.scheme == 'https' ? 'wss' : 'ws';
  return u.replace(scheme: scheme);
}

final _getTablesUseCaseProvider = Provider<GetTablesUseCase>(
  (ref) => sl<GetTablesUseCase>(),
);
final _getMenuUseCaseProvider = Provider<GetMenuUseCase>(
  (ref) => sl<GetMenuUseCase>(),
);
final _createOrderUseCaseProvider = Provider<CreateOrderUseCase>(
  (ref) => sl<CreateOrderUseCase>(),
);
final _getKitchenQueueUseCaseProvider = Provider<GetKitchenQueueUseCase>(
  (ref) => sl<GetKitchenQueueUseCase>(),
);
final _markKitchenDoneUseCaseProvider = Provider<MarkKitchenDoneUseCase>(
  (ref) => sl<MarkKitchenDoneUseCase>(),
);
final _getActiveOrdersUseCaseProvider = Provider<GetActiveOrdersUseCase>(
  (ref) => sl<GetActiveOrdersUseCase>(),
);
final _createPaymentUseCaseProvider = Provider<CreatePaymentUseCase>(
  (ref) => sl<CreatePaymentUseCase>(),
);
final _getDailyReportUseCaseProvider = Provider<GetDailyReportUseCase>(
  (ref) => sl<GetDailyReportUseCase>(),
);
final _getTopItemsUseCaseProvider = Provider<GetTopItemsUseCase>(
  (ref) => sl<GetTopItemsUseCase>(),
);

final tablesProvider = FutureProvider.autoDispose<List<TableEntity>>(
  (ref) => ref.read(_getTablesUseCaseProvider)(),
);

final menuProvider = FutureProvider.autoDispose<List<MenuItemEntity>>(
  (ref) => ref.read(_getMenuUseCaseProvider)(),
);

class OrderCartNotifier extends StateNotifier<Map<int, int>> {
  OrderCartNotifier() : super(<int, int>{});

  void increase(int menuItemId) {
    state = {...state, menuItemId: (state[menuItemId] ?? 0) + 1};
  }

  void decrease(int menuItemId) {
    final current = state[menuItemId] ?? 0;
    if (current <= 1) {
      final next = {...state}..remove(menuItemId);
      state = next;
      return;
    }
    state = {...state, menuItemId: current - 1};
  }

  void clear() => state = <int, int>{};

  void restore(Map<int, int> snapshot) {
    state = snapshot;
  }
}

final orderCartProvider =
    StateNotifierProvider<OrderCartNotifier, Map<int, int>>(
      (ref) => OrderCartNotifier(),
    );

final selectedTableProvider = StateProvider<int?>((ref) => null);

class SendOrderController extends AutoDisposeAsyncNotifier<OrderEntity?> {
  @override
  FutureOr<OrderEntity?> build() => null;

  Future<void> sendOrder() async {
    final tableId = ref.read(selectedTableProvider);
    final cart = ref.read(orderCartProvider);
    if (tableId == null || cart.isEmpty) {
      return;
    }

    final optimisticCart = Map<int, int>.from(cart);
    ref.read(orderCartProvider.notifier).clear();
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final items = optimisticCart.entries
          .map((e) => CreateOrderLineInput(menuItemId: e.key, qty: e.value))
          .toList();
      return ref.read(_createOrderUseCaseProvider)(
        tableId: tableId,
        items: items,
      );
    });

    if (state.hasError) {
      ref.read(orderCartProvider.notifier).restore(optimisticCart);
    }
  }
}

final sendOrderControllerProvider =
    AutoDisposeAsyncNotifierProvider<SendOrderController, OrderEntity?>(
      SendOrderController.new,
    );

final kitchenQueueProvider = FutureProvider.autoDispose<List<OrderEntity>>(
  (ref) => ref.read(_getKitchenQueueUseCaseProvider)(),
);

/// Server gửi text JSON: `{ "event": "order.new" | "order.updated", "data": ... }`.
final kitchenRealtimeTickProvider = StreamProvider.autoDispose<int>((
  ref,
) async* {
  try {
    final channel = WebSocketChannel.connect(_kitchenWebSocketUri());
    ref.onDispose(channel.sink.close);
    await for (final raw in channel.stream) {
      if (raw is! String) continue;
      try {
        final map = jsonDecode(raw) as Map<String, dynamic>;
        final event = map['event'] as String?;
        if (event == 'order.new' || event == 'order.updated') {
          yield DateTime.now().millisecondsSinceEpoch;
        }
      } catch (_) {
        // Bỏ qua frame không phải JSON (ping, …).
      }
    }
  } catch (_) {
    while (true) {
      await Future<void>.delayed(const Duration(seconds: 5));
      yield DateTime.now().millisecondsSinceEpoch;
    }
  }
});

class KitchenActionController extends AutoDisposeAsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<void> done(int orderId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(_markKitchenDoneUseCaseProvider)(orderId);
    });
  }
}

final kitchenActionControllerProvider =
    AutoDisposeAsyncNotifierProvider<KitchenActionController, void>(
      KitchenActionController.new,
    );

final activeOrdersProvider = FutureProvider.autoDispose<List<OrderEntity>>(
  (ref) => ref.read(_getActiveOrdersUseCaseProvider)(),
);

class CashierActionController
    extends AutoDisposeAsyncNotifier<PaymentResultEntity?> {
  @override
  FutureOr<PaymentResultEntity?> build() => null;

  Future<void> payCash({required int orderId, required double amount}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return ref.read(_createPaymentUseCaseProvider)(
        orderId: orderId,
        method: 'cash',
        amount: amount,
      );
    });
  }
}

final cashierActionControllerProvider =
    AutoDisposeAsyncNotifierProvider<
      CashierActionController,
      PaymentResultEntity?
    >(CashierActionController.new);

final todayProvider = StateProvider<String>(
  (ref) => DateTime.now().toIso8601String().substring(0, 10),
);

final dailyReportProvider = FutureProvider.autoDispose<DailyReportEntity>((
  ref,
) {
  final date = ref.watch(todayProvider);
  return ref.read(_getDailyReportUseCaseProvider)(date);
});

final topItemsReportProvider = FutureProvider.autoDispose<List<TopItemEntity>>((
  ref,
) {
  final date = ref.watch(todayProvider);
  return ref.read(_getTopItemsUseCaseProvider)(date: date, limit: 10);
});
