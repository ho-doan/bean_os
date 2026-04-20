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
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  selectedItemColor: Theme.of(context).colorScheme.primary,
                  unselectedItemColor: Theme.of(context).colorScheme.onSurface,
                  selectedLabelStyle: Theme.of(context).textTheme.bodyMedium,
                  unselectedLabelStyle: Theme.of(context).textTheme.bodyMedium,
                  selectedIconTheme: IconThemeData(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  unselectedIconTheme: IconThemeData(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  currentIndex: navigationShell.currentIndex,
                  onTap:
                      (index) => navigationShell.goBranch(
                        index,
                        initialLocation: index == navigationShell.currentIndex,
                      ),
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Profile',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.chat),
                      label: 'Chats',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.contacts),
                      label: 'Contacts',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: 'Settings',
                    ),
                  ],
                ),
              ],
            );
          }
          return Row(
            children: [
              NavigationRail(
                selectedIndex: navigationShell.currentIndex,
                onDestinationSelected:
                    (index) => navigationShell.goBranch(
                      index,
                      initialLocation: index == navigationShell.currentIndex,
                    ),
                labelType: NavigationRailLabelType.all,
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.person),
                    label: Text('Profile'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.chat),
                    label: Text('Chats'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.contacts),
                    label: Text('Contacts'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.settings),
                    label: Text('Settings'),
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
