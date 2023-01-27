
import 'package:get_it/get_it.dart';

import '../../features/search_feature/data/repo/search_repo_impl.dart';
import '../../features/weather_feature/data/repo/weather_home_repo_imp.dart';


final GetIt serviceLocator = GetIt.instance;

void initServicesLocator() {
  serviceLocator.registerSingleton<WeatherHomeRepoImpl>(WeatherHomeRepoImpl());
  serviceLocator.registerSingleton<SearchRepoImpl>(SearchRepoImpl());
}
