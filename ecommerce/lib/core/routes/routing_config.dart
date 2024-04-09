

import 'package:ecommerce/core/constants/routing_constants.dart';
import 'package:ecommerce/features/product/presentation/screens/add_or_update_page.dart';
import 'package:ecommerce/features/product/presentation/screens/details_page.dart';
import 'package:ecommerce/features/product/presentation/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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