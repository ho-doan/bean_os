import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/pages/chat_detail_page.dart';
import '../../presentation/pages/chat_detail_settings_page.dart';
import '../../presentation/pages/chats_page.dart';
import '../../presentation/pages/contact_detail_page.dart';
import '../../presentation/pages/contact_edit_page.dart';
import '../../presentation/pages/contacts_page.dart';
import '../../presentation/pages/forgot_password_page.dart';
import '../../presentation/pages/login_page.dart';
import '../../presentation/pages/profile_detail_page.dart';
import '../../presentation/pages/profile_edit_page.dart';
import '../../presentation/pages/profile_page.dart';
import '../../presentation/pages/register_page.dart';
import '../../presentation/pages/settings_page.dart';
import '../../presentation/shell/main_layout.dart';

part 'router.g.dart';

/// Paths
/// ```txt
/// root
/// ├── login
/// │   ├── register
/// │   └── forgot-password
/// ├── profile
/// │   └── profile_detail
/// │       └── profile_edit
/// ├── chats (chat list)
/// │       └── chat_detail (/:chatId - chat detail)
/// │           └── chat_detail_settings (/:chatId/settings - chat detail settings)
/// ├── contacts
/// │   └── contacts_detail (/:contactId - contact detail)
/// │       └── contacts_edit (/:contactId/edit - contact edit)
/// └── settings
/// ```
class _P {
  /// /
  static const String root = '/';

  /// /login
  static const String login = '/login';

  /// /login/register
  static const String register = 'register';

  /// /login/forgot-password
  static const String forgotPassword = 'forgot-password';

  /// /profile
  static const String profile = '/profile';

  /// /profile/:profileId
  static const String profileDetail = ':profileId';

  /// /profile/:profileId/edit
  static const String profileEdit = 'edit';

  /// /chats
  static const String chats = '/chats';

  /// /chats/:chatId
  static const String chatDetail = ':chatId';

  /// /chats/:chatId/settings
  static const String chatDetailSettings = 'settings';

  /// /contacts
  static const String contacts = '/contacts';

  /// /contacts/:contactId
  static const String contactsDetail = ':contactId';

  /// /contacts/:contactId/edit
  static const String contactsEdit = 'edit';

  /// /settings
  static const String settings = '/settings';
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
    onLoginSuccess: () => ChatsRoute().go(context),
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
    TypedStatefulShellBranch<ProfileBranchData>(
      routes: [
        TypedGoRoute<ProfileRoute>(
          path: _P.profile,
          routes: [
            TypedGoRoute<ProfileDetailRoute>(
              path: _P.profileDetail,
              routes: [TypedGoRoute<ProfileEditRoute>(path: _P.profileEdit)],
            ),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch<ChatsBranchData>(
      routes: [
        TypedGoRoute<ChatsRoute>(
          path: _P.chats,
          routes: [
            TypedGoRoute<ChatDetailRoute>(
              path: _P.chatDetail,
              routes: [
                TypedGoRoute<ChatDetailSettingsRoute>(
                  path: _P.chatDetailSettings,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch<ContactsBranchData>(
      routes: [
        TypedGoRoute<ContactsRoute>(
          path: _P.contacts,
          routes: [
            TypedGoRoute<ContactsDetailRoute>(
              path: _P.contactsDetail,
              routes: [TypedGoRoute<ContactsEditRoute>(path: _P.contactsEdit)],
            ),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch<SettingsBranchData>(
      routes: [TypedGoRoute<SettingsRoute>(path: _P.settings)],
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

class ProfileBranchData extends StatefulShellBranchData {
  const ProfileBranchData();
}

class ChatsBranchData extends StatefulShellBranchData {
  const ChatsBranchData();
}

class ContactsBranchData extends StatefulShellBranchData {
  const ContactsBranchData();
}

class SettingsBranchData extends StatefulShellBranchData {
  const SettingsBranchData();
}

class ProfileRoute extends GoRouteData with $ProfileRoute {
  const ProfileRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProfilePage(
      onOpenProfileDetail:
          (id) => ProfileDetailRoute(profileId: id).go(context),
    );
  }
}

class ProfileDetailRoute extends GoRouteData with $ProfileDetailRoute {
  final String profileId;

  const ProfileDetailRoute({required this.profileId});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProfileDetailPage(
      profileId: profileId,
      onOpenEdit:
          (id) => ProfileEditRoute(profileId: id).go(context),
    );
  }
}

class ProfileEditRoute extends GoRouteData with $ProfileEditRoute {
  final String profileId;

  const ProfileEditRoute({required this.profileId});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ProfileEditPage(profileId: profileId);
}

class ChatsRoute extends GoRouteData with $ChatsRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ChatsPage(
      onOpenChat: (id) => ChatDetailRoute(chatId: id).go(context),
    );
  }
}

class ChatDetailRoute extends GoRouteData with $ChatDetailRoute {
  final String chatId;

  const ChatDetailRoute({required this.chatId});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ChatDetailPage(
      chatId: chatId,
      onOpenSettings:
          (id) => ChatDetailSettingsRoute(chatId: id).go(context),
    );
  }
}

class ChatDetailSettingsRoute extends GoRouteData
    with $ChatDetailSettingsRoute {
  final String chatId;

  const ChatDetailSettingsRoute({required this.chatId});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ChatDetailSettingsPage(chatId: chatId);
}

class ContactsRoute extends GoRouteData with $ContactsRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ContactsPage(
      onOpenContact:
          (id) => ContactsDetailRoute(contactId: id).go(context),
    );
  }
}

class ContactsDetailRoute extends GoRouteData with $ContactsDetailRoute {
  final String contactId;

  const ContactsDetailRoute({required this.contactId});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ContactDetailPage(
      contactId: contactId,
      onOpenEdit:
          (id) => ContactsEditRoute(contactId: id).go(context),
    );
  }
}

class ContactsEditRoute extends GoRouteData with $ContactsEditRoute {
  final String contactId;

  const ContactsEditRoute({required this.contactId});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ContactEditPage(contactId: contactId);
}

class SettingsRoute extends GoRouteData with $SettingsRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SettingsPage();
}

final navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: navigatorKey,
  routes: $appRoutes,
  redirect: (context, state) {
    if (state.matchedLocation == _P.root) {
      return ChatsRoute().location;
    }
    return null;
  },
  refreshListenable: null,
  errorBuilder:
      (context, state) => Scaffold(
        body: Center(
          child: Column(
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
