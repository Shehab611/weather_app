import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/weather_feature/data/models/weather_model.dart';

class DailyWeatherModel extends Equatable {
  final num humidity;
  final num dayTemp;
  final num nightTemp;
  final String icon;
  final String date;

  const DailyWeatherModel(
      {required this.humidity,
      required this.dayTemp,
      required this.nightTemp,
      required this.icon,
      required this.date});

  factory DailyWeatherModel.fromJson(Map<String, dynamic> json) {
    return DailyWeatherModel(
        humidity: json['humidity'],
        dayTemp: json['temp']['day'],
        nightTemp: json['temp']['night'],
        icon: WeatherModel.fromJson(json['weather'][0]).icon,
        date: changeTimeStampToDay(json['dt']));
  }

  @override
  List<Object> get props => [humidity, nightTemp,nightTemp, icon, date];
}

String changeTimeStampToDay(int timeStamp) {
  var dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
  return '${DateFormat('E').format(dateTime)} ${dateTime.day}';
}
