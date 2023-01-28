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
  String changeBackGroundImage(String weatherState) {
    int index = 0;
    List<String> images = [
      'assets/images/clear_sky.jpg',
      'assets/images/cloudy_sky.jpg',
      'assets/gif/rain.gif',
      'assets/images/mist.jpg','assets/images/thunderstorm.jpg','assets/images/haze.jpg'
    ];
    switch (weatherState.toLowerCase()) {
      case 'clear':
        {
          index = 0;
          break;
        }
      case 'clouds':
        {
          index = 1;
          break;
        }
      case 'rain':
        {
          index = 2;
          break;
        }
      case 'mist':
        {
          index = 3;
          break;
        }
      case 'thunderstorm':{
        index=4;
        break;
      }
      case 'haze':{
        index=5;
        break;
      }
      default:
        {
          index = 0;
        }
    }
    return images[index];
  }
}
