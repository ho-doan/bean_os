import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    if (!navigationShell.route.branches.any(
      (e) =>
          e.defaultRoute?.path ==
          navigationShell.shellRouteContext.routeMatchList.fullPath,
    )) {
      return navigationShell;
    }
    return Scaffold(
      body: Builder(
        builder: (context) {
          final isMobile = MediaQuery.of(context).size.width < 600;
          if (isMobile) {
            return Column(
              children: [
                Expanded(child: navigationShell),
                BottomNavigationBar(
                  currentIndex: navigationShell.currentIndex,
                  onTap: (index) => navigationShell.goBranch(
                    index,
                    initialLocation: index == navigationShell.currentIndex,
                  ),
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.white,
                  selectedItemColor: Theme.of(context).colorScheme.primary,
                  unselectedItemColor: Theme.of(
                    context,
                  ).colorScheme.onSurfaceVariant,
                  selectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.point_of_sale),
                      label: 'Order',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.soup_kitchen),
                      label: 'Kitchen',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.payments),
                      label: 'Cashier',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.bar_chart),
                      label: 'Reports',
                    ),
                  ],
                ),
              ],
            );
          }
          return Row(
            children: [
              NavigationRail(
                backgroundColor: Colors.white,
                selectedIndex: navigationShell.currentIndex,
                onDestinationSelected: (index) => navigationShell.goBranch(
                  index,
                  initialLocation: index == navigationShell.currentIndex,
                ),
                labelType: NavigationRailLabelType.all,
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.point_of_sale),
                    label: Text('Order'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.soup_kitchen),
                    label: Text('Kitchen'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.payments),
                    label: Text('Cashier'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.bar_chart),
                    label: Text('Reports'),
                  ),
                ],
              ),
              const VerticalDivider(thickness: 1, width: 1),
              Expanded(child: navigationShell),
            ],
          );
        },
      ),
    );
  }
}
