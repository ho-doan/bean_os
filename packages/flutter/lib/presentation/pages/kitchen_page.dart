import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/mvp_providers.dart';

class KitchenPage extends ConsumerWidget {
  const KitchenPage({super.key});

  Color _statusColor(String status) {
    switch (status) {
      case 'pending':
        return const Color(0xFFFFF3CD);
      case 'preparing':
        return const Color(0xFFD1ECF1);
      case 'ready':
        return const Color(0xFFD4EDDA);
      default:
        return const Color(0xFFF8F9FA);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(kitchenRealtimeTickProvider);
    final queue = ref.watch(kitchenQueueProvider);
    final action = ref.watch(kitchenActionControllerProvider);

    ref.listen(kitchenRealtimeTickProvider, (_, __) {
      ref.invalidate(kitchenQueueProvider);
    });
    ref.listen(kitchenActionControllerProvider, (previous, next) {
      if ((previous?.isLoading ?? false) && next.hasValue) {
        ref.invalidate(kitchenQueueProvider);
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Kitchen')),
      body: queue.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Tai queue that bai: $e')),
        data: (orders) {
          if (orders.isEmpty) {
            return const Center(child: Text('Khong co don trong hang doi'));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              final order = orders[index];
              return Dismissible(
                key: ValueKey(order.id),
                direction: DismissDirection.endToStart,
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 16),
                  color: Colors.green,
                  child: const Icon(Icons.check, color: Colors.white),
                ),
                confirmDismiss: (_) async {
                  await ref
                      .read(kitchenActionControllerProvider.notifier)
                      .done(order.id);
                  return false;
                },
                child: Card(
                  color: _statusColor(order.status),
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Don #${order.id} | Ban ${order.tableId}',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...order.items.map(
                        (i) => Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Row(
                            children: [
                              Text(
                                '${i.qty}x ',
                                style: const TextStyle(fontSize: 20),
                              ),
                              Expanded(
                                child: Text(
                                  i.menuName ?? 'Mon ${i.menuItemId}',
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                              if (i.note != null && i.note!.isNotEmpty)
                                Flexible(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.yellow.shade100,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        i.note!,
                                        textAlign: TextAlign.right,
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Chip(
                            label: Text(order.status.toUpperCase()),
                            visualDensity: VisualDensity.compact,
                          ),
                          const Spacer(),
                          FilledButton.icon(
                            onPressed: action.isLoading
                                ? null
                                : () => ref
                                    .read(kitchenActionControllerProvider.notifier)
                                    .done(order.id),
                            icon: const Icon(Icons.check),
                            label: const Text('Xong'),
                          ),
                        ],
                      ),
                    ],
                  ),
                        ),
                ),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemCount: orders.length,
          );
        },
      ),
    );
  }
}
