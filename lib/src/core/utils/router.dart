import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skeeper/src/data.dart';

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(navigatorKey: navKey, routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeView(),
  )
]);
