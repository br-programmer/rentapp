import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rentapp/core/core.dart';
import 'package:rentapp/features/features.dart';

mixin RouterMixin on State<RentApp> {
  final _route = GoRouter(
    initialLocation: SplashScreen.route,
    routes: [
      GoRoute(
        path: SplashScreen.route,
        builder: (_, __) => const SplashScreen(),
      ),
      GoRoute(
        path: LoginScreen.route,
        builder: (_, __) => const LoginScreen(),
      ),
      GoRoute(
        path: RegisterScreen.route,
        builder: (_, __) => const RegisterScreen(),
      ),
      GoRoute(
        path: HomeScreen.route,
        builder: (_, __) => const HomeScreen(),
      ),
      GoRoute(
        path: UserScreen.route,
        builder: (_, __) => const UserScreen(),
      ),
    ],
  );

  GoRouter get appRouter => _route;
}
