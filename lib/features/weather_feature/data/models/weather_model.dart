import 'package:equatable/equatable.dart';

class WeatherModel extends Equatable {
  final num id;
  final String main;
  final String description;
  final String icon;

  const WeatherModel(
      {required this.id,
      required this.main,
      required this.description,
      required this.icon});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        icon: json['icon'] ,
        description: json['description'],
        id: json['id'],
        main: json['main']);
  }

  @override
  List<Object> get props => [id, main, description, icon];
}
