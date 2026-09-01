import 'package:go_router/go_router.dart';
import 'package:learn_pulse/features/auth/presentation/screens/auth_screen.dart';
import 'package:learn_pulse/features/home/presentation/screens/home_screen.dart';
import 'package:learn_pulse/features/settings/presentation/screens/settings_screen.dart';
import 'package:learn_pulse/core/widgets/main_navigation.dart';


final router = GoRouter(
  initialLocation: '/auth',
  routes: [
    GoRoute(path: '/auth', builder: (context, state) => const AuthScreen()),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainNavigation(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: "home",
              path: '/',
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: "settings",
              path: '/settings',
              builder: (context, state) => const SettingsScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
