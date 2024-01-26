import 'package:go_router/go_router.dart';
import 'package:mauzy_food/presentation/pages/detail_page.dart';
import 'package:mauzy_food/presentation/pages/home_page.dart';
import 'package:mauzy_food/presentation/pages/splash_page.dart';

import '../presentation/pages/error_page.dart';
import 'names_route.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  errorBuilder: (context, state) => const ErrorPage(),
  routes: [
    GoRoute(
      path: '/',
      name: Routes.splash,
      builder: (context, state) {
        return const SplashPage();
      },
    ),
    GoRoute(
      path: '/home',
      name: Routes.home,
      builder: (context, state) {
        return const HomePage();
      },
      routes: [
        GoRoute(
          path: 'detail/:id',
          name: Routes.detail,
          builder: (context, state) => DetailPage(
            id: state.pathParameters['id'] ?? '',
          ),
        ),
      ],
    ),
  ],
);
