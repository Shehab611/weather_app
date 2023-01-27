import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/features/weather_feature/data/models/current_weather_model.dart';

import '../../../data/repo/weather_home_repo.dart';

part 'current_weather_state.dart';

class CurrentWeatherCubit extends Cubit<CurrentWeatherState> {
  final WeatherHomeRepo weatherHomeRepo;
  CurrentWeatherCubit(this.weatherHomeRepo) : super(CurrentWeatherInitial());

  Future<void> getWeatherData(City city) async {
    emit(CurrentWeatherLoading());
    var result = await weatherHomeRepo.getCurrentWeatherData(city: city);
    result.fold((failure) => emit(CurrentWeatherFailure(failure.errMessage)),
            (currentWeather) => emit(CurrentWeatherSuccess(currentWeather)));
  }

}
