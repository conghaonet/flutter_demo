import 'package:flutter/material.dart';
import 'package:flutter_demo/src/home_page.dart';
import 'package:flutter_demo/src/page/image_cache_page.dart';
import 'package:flutter_demo/src/page/scroll_listener_page.dart';
import 'package:flutter_demo/src/page/scroll_to_index_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  factory AppRouter() => _appRoute;
  static final AppRouter _appRoute = AppRouter._internal();
  AppRouter._internal();

  /// The route configuration.
  final GoRouter _goRouter = GoRouter(
    restorationScopeId: 'go_router',
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => const HomePage(),
        routes: <RouteBase>[
          GoRoute(
            path: ImageCachePage.pagePathName,
            builder: (BuildContext context, GoRouterState state) => const ImageCachePage(),
          ),
          GoRoute(
            path: ScrollListenerPage.pagePathName,
            builder: (BuildContext context, GoRouterState state) => const ScrollListenerPage(),
          ),
          GoRoute(
            path: ScrollToIndexPage.pagePathName,
            builder: (BuildContext context, GoRouterState state) => const ScrollToIndexPage(),
          ),
        ],
      ),
    ],
  );
  GoRouter get goRouter => _goRouter;
}
AppRouter appRouter = AppRouter();