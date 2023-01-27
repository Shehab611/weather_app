import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/features/weather_feature/data/models/daily_weather_model.dart';

import '../../../data/repo/weather_home_repo.dart';

part 'daily_weather_state.dart';

class DailyWeatherCubit extends Cubit<DailyWeatherState> {
  final WeatherHomeRepo weatherHomeRepo;
  DailyWeatherCubit(this.weatherHomeRepo) : super(DailyWeatherInitial());

  Future<void> getWeatherData(City city) async {
    emit(DailyWeatherLoading());
    var result = await weatherHomeRepo.getDailyWeatherData(city: city);
    result.fold((failure) => emit(DailyWeatherFailure(failure.errMessage)),
            (currentWeather) => emit(DailyWeatherSuccess(currentWeather)));
  }
}
