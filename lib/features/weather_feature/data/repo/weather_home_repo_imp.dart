import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/core/failure/failures.dart';
import 'package:weather_app/core/utils/api_service.dart';
import 'package:weather_app/features/weather_feature/data/models/current_weather_model.dart';
import 'package:weather_app/features/weather_feature/data/models/daily_weather_model.dart';
import 'package:weather_app/features/weather_feature/data/models/hourly_weather_model.dart';
import 'package:weather_app/features/weather_feature/data/repo/weather_home_repo.dart';

class WeatherHomeRepoImpl extends WeatherHomeRepo {

  @override
  Future<Either<Failure, CurrentWeatherModel>> getCurrentWeatherData(
      {required City city}) async {
    DioHelper.init(url: 'https://api.openweathermap.org/data/3.0/');
    try {
      var data = await DioHelper.getData(
          endPoint:
              'onecall?lat=${city.lat}&lon=${city.lon}4&exclude=minutely&appid=$kApiKey');

      return right(CurrentWeatherModel.fromJson(data.data['current']));
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DailyWeatherModel>>> getDailyWeatherData(
      {required City city}) async {
    DioHelper.init(url: 'https://api.openweathermap.org/data/3.0/');
    try {
      List<DailyWeatherModel> list=[];
      var data = await DioHelper.getData(
          endPoint:
              'onecall?lat=${city.lat}&lon=${city.lon}4&exclude=minutely&appid=$kApiKey');
      for (var item in data.data['daily']) {
        list.add(DailyWeatherModel.fromJson(item));
      }
      return right(list);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<HourlyWeatherModel>>> getHourlyWeatherData(
      {required City city}) async {
    DioHelper.init(url: 'https://api.openweathermap.org/data/3.0/');
    try {
      List<HourlyWeatherModel> list=[];
      var data = await DioHelper.getData(
          endPoint:
              'onecall?lat=${city.lat}&lon=${city.lon}4&exclude=minutely&appid=$kApiKey');

      for (var item in data.data['hourly']) {
        list.add(HourlyWeatherModel.fromJson(item));
      }

      return right(list);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
