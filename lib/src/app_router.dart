import 'package:flutter/material.dart';
import 'package:flutter_demo/src/home_page.dart';
import 'package:flutter_demo/src/page/clip_demo_page.dart';
import 'package:flutter_demo/src/page/floating_touch_page.dart';
import 'package:flutter_demo/src/page/future_builder_page.dart';
import 'package:flutter_demo/src/page/hit_test_behavior_page.dart';
import 'package:flutter_demo/src/page/image_cache_page.dart';
import 'package:flutter_demo/src/page/inherited_widget_demo_page.dart';
import 'package:flutter_demo/src/page/refresh_load_more_page.dart';
import 'package:flutter_demo/src/page/scroll_listener_page.dart';
import 'package:flutter_demo/src/page/scroll_to_index_page.dart';
import 'package:flutter_demo/src/page/scroll_to_index_page2.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._internal();
  static final AppRouter _appRoute = AppRouter._internal();
  factory AppRouter() => _appRoute;

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
          GoRoute(
            path: ScrollToIndexPage2.pagePathName,
            builder: (BuildContext context, GoRouterState state) => const ScrollToIndexPage2(),
          ),
          GoRoute(
            path: RefreshLoadMorePage.pagePathName,
            builder: (BuildContext context, GoRouterState state) => const RefreshLoadMorePage(),
          ),
          GoRoute(
            path: FloatingTouchPage.pagePathName,
            builder: (BuildContext context, GoRouterState state) => const FloatingTouchPage(),
          ),
          GoRoute(
            path: HitTestBehaviorPage.pagePathName,
            builder: (BuildContext context, GoRouterState state) => const HitTestBehaviorPage(),
          ),
          GoRoute(
            path: FutureBuilderPage.pagePathName,
            builder: (BuildContext context, GoRouterState state) => const FutureBuilderPage(),
          ),
          GoRoute(
            path: InheritedWidgetDemoPage.pagePathName,
            builder: (BuildContext context, GoRouterState state) => const InheritedWidgetDemoPage(),
          ),
          GoRoute(
            path: ClipDemoPage.pagePathName,
            builder: (BuildContext context, GoRouterState state) => const ClipDemoPage(),
          ),
        ],
      ),
    ],
  );
  GoRouter get goRouter => _goRouter;
}