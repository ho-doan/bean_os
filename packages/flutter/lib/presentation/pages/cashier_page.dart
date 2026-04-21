import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/mvp_providers.dart';

class CashierPage extends ConsumerWidget {
  const CashierPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orders = ref.watch(activeOrdersProvider);
    final payment = ref.watch(cashierActionControllerProvider);

    ref.listen(cashierActionControllerProvider, (previous, next) {
      if ((previous?.isLoading ?? false) && next.hasValue) {
        final result = next.value;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Thanh toan OK | Tong ${result?.orderTotal.toStringAsFixed(0)} | Thoi ${result?.changeAmount.toStringAsFixed(0)}',
            ),
          ),
        );
        ref.invalidate(activeOrdersProvider);
      }
      if ((previous?.isLoading ?? false) && next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Thanh toan that bai: ${next.error}')),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Cashier')),
      body: orders.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Tai don active that bai: $e')),
        data: (rows) {
          if (rows.isEmpty) {
            return const Center(child: Text('Khong co don chua thanh toan'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: rows.length,
            itemBuilder: (context, index) {
              final order = rows[index];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Don #${order.id} | Ban ${order.tableId} | ${order.status}'),
                      const SizedBox(height: 6),
                      Text('Tong tam tinh: ${order.total.toStringAsFixed(0)} VND'),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        alignment: WrapAlignment.end,
                        children: [
                          OutlinedButton(
                            onPressed: payment.isLoading
                                ? null
                                : () => ref
                                    .read(cashierActionControllerProvider.notifier)
                                    .payCash(
                                      orderId: order.id,
                                      amount: order.total,
                                    ),
                            child: const Text('Thu dung tien'),
                          ),
                          FilledButton.icon(
                            onPressed: payment.isLoading
                                ? null
                                : () => ref
                                    .read(cashierActionControllerProvider.notifier)
                                    .payCash(
                                      orderId: order.id,
                                      amount: order.total + 50000,
                                    ),
                            icon: const Icon(Icons.payments_outlined),
                            label: const Text('Thu +50.000'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
