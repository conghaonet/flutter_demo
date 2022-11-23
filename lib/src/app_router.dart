import 'package:flutter/material.dart';
import 'package:flutter_demo/src/home_page.dart';
import 'package:flutter_demo/src/page/image_cache_page.dart';
import 'package:flutter_demo/src/page/list_page.dart';
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
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: ImageCachePage.pagePathName,
            builder: (BuildContext context, GoRouterState state) {
              return const ImageCachePage();
            },
          ),
          GoRoute(
            path: ListPage.pagePathName,
            builder: (BuildContext context, GoRouterState state) {
              return const ListPage();
            },
          ),
        ],
      ),

    ],
  );
  GoRouter get goRouter => _goRouter;

}
AppRouter appRouter = AppRouter();