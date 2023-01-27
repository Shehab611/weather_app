import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/hourly_weather_model.dart';
import '../../../data/repo/weather_home_repo.dart';

part 'hourly_weather_state.dart';

class HourlyWeatherCubit extends Cubit<HourlyWeatherState> {
  final WeatherHomeRepo weatherHomeRepo;
  HourlyWeatherCubit(this.weatherHomeRepo) : super(HourlyWeatherInitial());

  Future<void> getWeatherData(City city) async {
    emit(HourlyWeatherLoading());
    var result = await weatherHomeRepo.getHourlyWeatherData(city: city);
    result.fold((failure) => emit(HourlyWeatherFailure(failure.errMessage)),
            (currentWeather) => emit(HourlyWeatherSuccess(currentWeather)));
  }
}
