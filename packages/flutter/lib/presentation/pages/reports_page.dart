import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/mvp_providers.dart';

class ReportsPage extends ConsumerWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(todayProvider);
    final daily = ref.watch(dailyReportProvider);
    final items = ref.watch(topItemsReportProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(28),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Tong quan doanh thu va mon ban chay',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              title: const Text('Ngay bao cao'),
              subtitle: Text(date),
              trailing: FilledButton.tonalIcon(
                onPressed: () {
                  ref.invalidate(dailyReportProvider);
                  ref.invalidate(topItemsReportProvider);
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Refresh'),
              ),
            ),
          ),
          const SizedBox(height: 12),
          daily.when(
            loading: () => const Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
            error: (e, _) => Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text('Loi report daily: $e'),
              ),
            ),
            data: (d) => Card(
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.trending_up),
                ),
                title: const Text('Doanh thu ngay'),
                subtitle: Text(
                  'Tong: ${d.totalRevenue.toStringAsFixed(0)} VND | So don: ${d.orderCount}',
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text('Top mon', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          items.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Text('Loi report items: $e'),
            data: (rows) => Card(
              child: Column(
                children: rows
                    .map(
                      (e) => ListTile(
                        dense: true,
                        leading: const Icon(Icons.restaurant_menu),
                        title: Text(e.name),
                        trailing: Text('x${e.qtySold}'),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
