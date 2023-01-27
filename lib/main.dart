import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/constants.dart';
import 'core/utils/app_router.dart';
import 'core/utils/services_locator.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   // final WeatherHomeRepo weatherHomeRepo=WeatherHomeRepoImpl();
   // var result = await weatherHomeRepo.getDailyWeatherData(city: City(lat: 30.44, lon: 90.2));
   // print(result);




  initServicesLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: const MaterialColor(0x87CEF0, kColorCodes),
        scaffoldBackgroundColor: kClearSkyScaffoldColor,
      ),
      routerConfig: AppRouter.router,
    );
  }
}

