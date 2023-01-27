import 'package:equatable/equatable.dart';
import 'package:weather_app/features/weather_feature/data/models/weather_model.dart';

class CurrentWeatherModel extends Equatable {
  const CurrentWeatherModel({required this.sunrise,
    required this.sunset,
    required this.pressure,
    required this.humidity,
    required this.temp,
    required this.feelsLike,
    required this.dewPoint,
    required this.windSpeed,
    required this.weather});

  final String sunrise;
  final String sunset;
  final num pressure;
  final num humidity;
  final num temp;
  final num feelsLike;
  final num dewPoint;
  final num windSpeed;
  final WeatherModel weather;

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json){
    return CurrentWeatherModel(sunrise: changeTimeStampToTime(json['sunrise']),
        sunset: changeTimeStampToTime(json['sunset']),
        pressure: json['pressure'],
        humidity: json['humidity'],
        temp: json['temp'],
        feelsLike: json['feels_like'],
        dewPoint: json['dew_point'],
        windSpeed: json['wind_speed'],
        weather: WeatherModel.fromJson(json['weather'][0]));
  }

  @override
  List<Object> get props =>
      [
        sunrise,
        sunset,
        pressure,
        humidity,
        temp,
        feelsLike,
        dewPoint,
        windSpeed,
        weather,
      ];


}


String changeTimeStampToTime(int timeStamp) {
  var dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
  return '${dateTime.hour}:${dateTime.minute}:${dateTime.second}';
}
