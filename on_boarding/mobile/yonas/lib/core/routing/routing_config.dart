import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../pages/pages.dart';
import '../constants/constants.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        name: RouteConstants.homePageRouteName,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        }),
    GoRoute(
        path: '/details',
        name: RouteConstants.detailsPageRouteName,
        builder: (BuildContext context, GoRouterState state) {
          return const DetailsPage();
        }),
    GoRoute(
        path: '/addOrUpdatePage',
        name: RouteConstants.addOrUpdatePageRouteName,
        builder: (BuildContext context, GoRouterState state) {
          return const AddOrUpdatePage();
        }),
  ],
);