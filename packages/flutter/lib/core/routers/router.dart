import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/pages/cashier_page.dart';
import '../../presentation/pages/forgot_password_page.dart';
import '../../presentation/pages/kitchen_page.dart';
import '../../presentation/pages/login_page.dart';
import '../../presentation/pages/order_page.dart';
import '../../presentation/pages/register_page.dart';
import '../../presentation/pages/reports_page.dart';
import '../../presentation/shell/main_layout.dart';

part 'router.g.dart';

class _P {
  static const String root = '/';
  static const String login = '/login';
  static const String register = 'register';
  static const String forgotPassword = 'forgot-password';

  static const String orders = '/orders';
  static const String kitchen = '/kitchen';
  static const String cashier = '/cashier';
  static const String reports = '/reports';
}

@TypedGoRoute<LoginRoute>(
  path: _P.login,
  routes: [
    TypedGoRoute<RegisterRoute>(path: _P.register),
    TypedGoRoute<ForgotPasswordRoute>(path: _P.forgotPassword),
  ],
)
class LoginRoute extends GoRouteData with $LoginRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) => LoginPage(
    onLoginSuccess: () => OrdersRoute().go(context),
  );
}

class RegisterRoute extends GoRouteData with $RegisterRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const RegisterPage();
}

class ForgotPasswordRoute extends GoRouteData with $ForgotPasswordRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ForgotPasswordPage();
}

@TypedStatefulShellRoute<MainShellRoute>(
  branches: [
    TypedStatefulShellBranch<OrdersBranchData>(
      routes: [TypedGoRoute<OrdersRoute>(path: _P.orders)],
    ),
    TypedStatefulShellBranch<KitchenBranchData>(
      routes: [TypedGoRoute<KitchenRoute>(path: _P.kitchen)],
    ),
    TypedStatefulShellBranch<CashierBranchData>(
      routes: [TypedGoRoute<CashierRoute>(path: _P.cashier)],
    ),
    TypedStatefulShellBranch<ReportsBranchData>(
      routes: [TypedGoRoute<ReportsRoute>(path: _P.reports)],
    ),
  ],
)
class MainShellRoute extends StatefulShellRouteData {
  const MainShellRoute();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) => MainLayout(navigationShell: navigationShell);
}

class OrdersBranchData extends StatefulShellBranchData {
  const OrdersBranchData();
}

class KitchenBranchData extends StatefulShellBranchData {
  const KitchenBranchData();
}

class CashierBranchData extends StatefulShellBranchData {
  const CashierBranchData();
}

class ReportsBranchData extends StatefulShellBranchData {
  const ReportsBranchData();
}

class OrdersRoute extends GoRouteData with $OrdersRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) => const OrderPage();
}

class KitchenRoute extends GoRouteData with $KitchenRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const KitchenPage();
}

class CashierRoute extends GoRouteData with $CashierRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CashierPage();
}

class ReportsRoute extends GoRouteData with $ReportsRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ReportsPage();
}

final navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: navigatorKey,
  routes: $appRoutes,
  refreshListenable: ,
  redirect: (context, state) {
    if (state.matchedLocation == _P.root) {
      return OrdersRoute().location;
    }
    return null;
  },
  errorBuilder:
      (context, state) => Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Page not found (path: ${state.matchedLocation})'),
              TextButton(
                onPressed: () => context.go(_P.root),
                child: const Text('Go to home'),
              ),
            ],
          ),
        ),
      ),
);
