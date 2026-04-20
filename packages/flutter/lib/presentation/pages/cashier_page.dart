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
      appBar: AppBar(title: const Text('Cashier / Thu ngan')),
      body: orders.when(
        loading: () => const SizedBox.shrink(),
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
              final amountController = TextEditingController(
                text: order.total > 0 ? order.total.toStringAsFixed(0) : '0',
              );
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Don #${order.id} | Ban ${order.tableId} | ${order.status}'),
                      const SizedBox(height: 6),
                      Text('Tong tam tinh: ${order.total.toStringAsFixed(0)} VND'),
                      const SizedBox(height: 6),
                      TextField(
                        controller: amountController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Tien khach dua',
                          isDense: true,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: FilledButton(
                          onPressed: payment.isLoading
                              ? null
                              : () {
                                  final amount =
                                      double.tryParse(
                                        amountController.text.trim(),
                                      ) ??
                                      0;
                                  ref
                                      .read(cashierActionControllerProvider
                                          .notifier)
                                      .payCash(orderId: order.id, amount: amount);
                                },
                          child: const Text('Thanh toan cash'),
                        ),
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
