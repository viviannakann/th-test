import 'package:auto_route/auto_route.dart';
import 'package:coment_management/main.dart';
import 'package:flutter/material.dart';

import '../presentations/post/post_screen.dart';
import '../presentations/post_listing/post_listing_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page|Screen|BottomSheet,Route',
  generateForDir: ['lib/src/ui/presentations'],
)
class AppRouter extends _$AppRouter {
  AppRouter() : super(MyApp.globalNavKey);

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  late final List<AutoRoute> routes = [
    AutoRoute(
      path: PostListingScreen.path,
      page: PostListingRoute.page,
    ),
    AutoRoute(
      path: PostScreen.path,
      page: PostRoute.page,
    ),
  ];
}
