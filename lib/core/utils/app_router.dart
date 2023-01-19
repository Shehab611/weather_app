import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash_feature/presentation/views/splash_view.dart';
import '../../features/weather_feature/presentation/views/weather_view.dart';


abstract class AppRouter{
  static const kWeatherHomeView='/WeatherHome';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: kWeatherHomeView,
        builder: (BuildContext context, GoRouterState state) {
          return const WeatherHome();
        },
      ),

    ],
  );
}