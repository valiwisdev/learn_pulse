import 'package:go_router/go_router.dart';
import 'package:learn_pulse/features/auth/presentation/screens/auth_screen.dart';

final router = GoRouter(
  initialLocation: '/auth',
  routes: [
    GoRoute(path: '/auth', builder: (context, state) => const AuthScreen()),
  ],
);
