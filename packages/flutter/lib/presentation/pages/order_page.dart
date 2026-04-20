import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/mvp_entities.dart';
import '../riverpod/mvp_providers.dart';

class OrderPage extends ConsumerWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

    final menuById = {
      for (final item in menu.valueOrNull ?? <MenuItemEntity>[]) item.id: item,
    };
    final total = cart.entries.fold<double>(
      0,
      (sum, e) => sum + (menuById[e.key]?.price ?? 0) * e.value,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Order / Phuc vu')),
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
              loading: () => const SizedBox.shrink(),
              error: (e, _) => Center(child: Text('Tai menu that bai: $e')),
              data: (items) {
                final available = items.where((e) => e.isAvailable).toList();
                return GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 2.4,
                  ),
                  itemCount: available.length,
                  itemBuilder: (context, index) {
                    final item = available[index];
                    final qty = cart[item.id] ?? 0;
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    item.name,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Text('${item.price.toStringAsFixed(0)} VND'),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: qty > 0
                                  ? () =>
                                      ref
                                          .read(orderCartProvider.notifier)
                                          .decrease(item.id)
                                  : null,
                              icon: const Icon(Icons.remove_circle_outline),
                            ),
                            Text('$qty', style: const TextStyle(fontSize: 18)),
                            IconButton(
                              onPressed: () =>
                                  ref
                                      .read(orderCartProvider.notifier)
                                      .increase(item.id),
                              icon: const Icon(Icons.add_circle_outline),
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
                  child: Text(
                    'Mon: ${cart.values.fold<int>(0, (a, b) => a + b)} | Tong: ${total.toStringAsFixed(0)} VND',
                  ),
                ),
                FilledButton(
                  onPressed: sending.isLoading
                      ? null
                      : () =>
                          ref.read(sendOrderControllerProvider.notifier).sendOrder(),
                  child: sending.isLoading
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
