import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/features/weather_feature/presentation/views/weather_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: const MaterialColor(0x87CEF0,kColorCodes),
          scaffoldBackgroundColor: kClearSkyScaffoldColor),
      home: const WeatherHome(),
    );
  }
}
