import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'core/utils/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Weather App',
      theme: ThemeData(
          primarySwatch: const MaterialColor(0x87CEF0,kColorCodes),
          scaffoldBackgroundColor: kClearSkyScaffoldColor),
      routerConfig: AppRouter.router,
    );
  }
}
