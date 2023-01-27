import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/core/failure/failures.dart';
import 'package:weather_app/features/weather_feature/data/models/current_weather_model.dart';
import 'package:weather_app/features/weather_feature/data/models/daily_weather_model.dart';
import 'package:weather_app/features/weather_feature/data/models/hourly_weather_model.dart';

abstract class WeatherHomeRepo {
  Future<Either<Failure, CurrentWeatherModel>> getCurrentWeatherData({required City city});

  Future<Either<Failure, List<HourlyWeatherModel>>> getHourlyWeatherData({required City city});

  Future<Either<Failure, List<DailyWeatherModel>>> getDailyWeatherData({required City city});
}

class City extends Equatable {
  final num lat;
  final num lon;

  const City({required this.lat, required this.lon});

  @override
  List<Object> get props => [lat, lon];
}
