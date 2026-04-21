import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/mvp_entities.dart';
import '../riverpod/mvp_providers.dart';

class OrderPage extends ConsumerWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(kitchenRealtimeTickProvider);
    final tables = ref.watch(tablesProvider);
    final menu = ref.watch(menuProvider);
    final cart = ref.watch(orderCartProvider);
    final selectedTable = ref.watch(selectedTableProvider);
    final sending = ref.watch(sendOrderControllerProvider);

    ref.listen(sendOrderControllerProvider, (previous, next) {
      if ((previous?.isLoading ?? false) && next.hasValue) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Da gui bep don #${next.value?.id ?? '-'}')),
        );
      }
      if ((previous?.isLoading ?? false) && next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gui don that bai: ${next.error}')),
        );
      }
    });
    ref.listen(kitchenRealtimeTickProvider, (_, __) {
      ref.invalidate(tablesProvider);
    });

    final menuById = {
      for (final item in menu.valueOrNull ?? <MenuItemEntity>[]) item.id: item,
    };
    final total = cart.entries.fold<double>(
      0,
      (sum, e) => sum + (menuById[e.key]?.price ?? 0) * e.value,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fresh Order'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(28),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Chon ban va mon theo phong cach Grocery',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: tables.when(
              loading: () => const SizedBox(height: 44),
              error: (e, _) => Text('Tai ban that bai: $e'),
              data: (rows) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: rows.map((t) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ChoiceChip(
                          avatar: Icon(
                            Icons.table_restaurant_outlined,
                            size: 16,
                            color: selectedTable == t.id
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                          label: Text('${t.label} (${t.status})'),
                          selected: selectedTable == t.id,
                          onSelected: t.isFree || selectedTable == t.id
                              ? (_) =>
                                  ref.read(selectedTableProvider.notifier).state =
                                      t.id
                              : null,
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: menu.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Tai menu that bai: $e')),
              data: (items) {
                final available = items.where((e) => e.isAvailable).toList();
                if (available.isEmpty) {
                  return const Center(child: Text('Menu trong'));
                }
                return GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1.45,
                  ),
                  itemCount: available.length,
                  itemBuilder: (context, index) {
                    final item = available[index];
                    final qty = cart[item.id] ?? 0;
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${item.price.toStringAsFixed(0)} VND',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                IconButton.filledTonal(
                                  onPressed: qty > 0
                                      ? () => ref
                                          .read(orderCartProvider.notifier)
                                          .decrease(item.id)
                                      : null,
                                  icon: const Icon(Icons.remove),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      '$qty',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  ),
                                ),
                                IconButton.filled(
                                  onPressed: () => ref
                                      .read(orderCartProvider.notifier)
                                      .increase(item.id),
                                  icon: const Icon(Icons.add),
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
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('So mon: ${cart.values.fold<int>(0, (a, b) => a + b)}'),
                      Text(
                        'Tong tam tinh: ${total.toStringAsFixed(0)} VND',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
                FilledButton.icon(
                  onPressed: sending.isLoading
                      ? null
                      : () =>
                          ref.read(sendOrderControllerProvider.notifier).sendOrder(),
                  icon: const Icon(Icons.send_rounded),
                  label: sending.isLoading
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Gui bep'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
