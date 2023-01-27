import 'package:equatable/equatable.dart';
import 'package:weather_app/features/weather_feature/data/models/weather_model.dart';

class HourlyWeatherModel extends Equatable {
  final num humidity;
  final num temp;
  final String icon;
  final String hour;

  const HourlyWeatherModel(
      {required this.humidity, required this.temp, required this.icon, required this.hour});

  factory HourlyWeatherModel.fromJson(Map<String, dynamic> json){
    return HourlyWeatherModel(
        humidity: json['humidity'],
        temp: json['temp'],
        icon: WeatherModel.fromJson(json['weather'][0]).icon,
        hour: changeTimeStampToHours(json['dt']));
  }

  @override
  List<Object> get props => [humidity, temp, icon, hour];
}

String changeTimeStampToHours(int timeStamp) {
  var dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
  if (dateTime.hour > 12) {
    return '${dateTime.hour - 12} PM';
  } else {
    return '${dateTime.hour} AM';
  }
}