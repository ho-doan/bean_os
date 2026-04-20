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
      appBar: AppBar(title: const Text('Reports')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Expanded(child: Text('Ngay bao cao: $date')),
              TextButton(
                onPressed: () {
                  ref.invalidate(dailyReportProvider);
                  ref.invalidate(topItemsReportProvider);
                },
                child: const Text('Refresh'),
              ),
            ],
          ),
          const SizedBox(height: 8),
          daily.when(
            loading: () => const SizedBox.shrink(),
            error: (e, _) => Text('Loi report daily: $e'),
            data: (d) => Card(
              child: ListTile(
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
            loading: () => const SizedBox.shrink(),
            error: (e, _) => Text('Loi report items: $e'),
            data: (rows) => Column(
              children: rows
                  .map(
                    (e) => ListTile(
                      dense: true,
                      title: Text(e.name),
                      trailing: Text('x${e.qtySold}'),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
