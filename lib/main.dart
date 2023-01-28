import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/core/utils/bloc_observer.dart';
import 'core/utils/app_router.dart';
import 'core/utils/services_locator.dart';

List<String> searchList = [];
readJson()async{
  final response = await rootBundle.loadString('assets/json/cities.json');
  final data = await json.decode(response);
  for (var i in data['city']) {searchList.add(i);}
}
void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  /*final SearchRepo weatherHomeRepo=SearchRepoImpl();
    var result = await weatherHomeRepo.getSearchResult(cityName: 'cairo');
    print(result);*/

  await readJson();


  initServicesLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Weather App',debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: const MaterialColor(0xA89A91, kColorCodes),
        scaffoldBackgroundColor: kClearSkyScaffoldColor,
      ),
      routerConfig: AppRouter.router,
    );
  }
}
