import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/core/utils/services_locator.dart';
import 'package:weather_app/features/weather_feature/presentation/view_model_manger/current_weather_cubit/current_weather_cubit.dart';
import 'package:weather_app/features/weather_feature/presentation/view_model_manger/weather_cubit/weather_cubit.dart';
import '../../features/splash_feature/presentation/views/splash_view.dart';
import '../../features/weather_feature/data/repo/weather_home_repo.dart';
import '../../features/weather_feature/data/repo/weather_home_repo_imp.dart';
import '../../features/weather_feature/presentation/view_model_manger/daily_weather_cubit/daily_weather_cubit.dart';
import '../../features/weather_feature/presentation/view_model_manger/hourly_weather_cubit/hourly_weather_cubit.dart';
import '../../features/weather_feature/presentation/views/weather_view.dart';

abstract class AppRouter {
  static const kWeatherHomeView = '/WeatherHome';

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
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                CurrentWeatherCubit(serviceLocator.get<WeatherHomeRepoImpl>())
                  ..getWeatherData(state.extra as City),
              ),
              BlocProvider(
                create: (context) =>
                DailyWeatherCubit(serviceLocator.get<WeatherHomeRepoImpl>())
                  ..getWeatherData(state.extra as City),
              ),
              BlocProvider(
                create: (context) =>
                HourlyWeatherCubit(serviceLocator.get<WeatherHomeRepoImpl>())
                  ..getWeatherData(state.extra as City),
              ),
              BlocProvider(
                create: (context) =>WeatherCubit()..changeCityName(state.extra as City)
              ),
            ],
            child:const WeatherHome(),
          );
        },
      ),
    ],
  );
}
