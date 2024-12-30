import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/presentation/screens.dart';

class AppRouter {
  final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/buttons',
          builder: (BuildContext context, GoRouterState state) {
            return const ButtonsScreen();
          },
        ),
        GoRoute(
          path: '/cards',
          builder: (BuildContext context, GoRouterState state) {
            return const CardsScreen();
          },
        ),
        GoRoute(
          path: '/progress',
          builder: (BuildContext context, GoRouterState state) {
            return const ProgresssScreen();
          },
        ),
        GoRoute(
          path: '/snackbar',
          builder: (BuildContext context, GoRouterState state) {
            return const SnackbarScreen();
          },
        ),
        GoRoute(
          path: '/animated',
          builder: (BuildContext context, GoRouterState state) {
            return const AnimatedScreen();
          },
        ),
        GoRoute(
          path: '/ui-controls',
          builder: (BuildContext context, GoRouterState state) {
            return const UiControlsScreen();
          },
        ),
        GoRoute(
          path: '/tutorial',
          builder: (BuildContext context, GoRouterState state) {
            return const AppTutorialScreen();
          },
        ),
        GoRoute(
          path: '/infinite',
          builder: (BuildContext context, GoRouterState state) {
            return const InfiniteScrollScreen();
          },
        ),
      ],
    ),
  ],
);
}