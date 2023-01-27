import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/constants.dart';
import 'core/utils/app_router.dart';
import 'core/utils/services_locator.dart';
import 'features/search_feature/data/repo/search_repo.dart';
import 'features/search_feature/data/repo/search_repo_impl.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
    /*final SearchRepo weatherHomeRepo=SearchRepoImpl();
    var result = await weatherHomeRepo.getSearchResult(cityName: 'cairo');
    print(result);*/




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

