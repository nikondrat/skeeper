import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template/src/data.dart';

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(navigatorKey: navKey, routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => HomeView(),
  )
]);
