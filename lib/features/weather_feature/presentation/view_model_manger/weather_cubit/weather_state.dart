part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}
class WeatherFailure extends WeatherState {
  final String errMessage;

  const WeatherFailure({required this.errMessage});

}
class WeatherSuccess extends WeatherState {
  final String cityName;

 const WeatherSuccess({required this.cityName,});

}
class WeatherShowSearch extends WeatherState{}
class WeatherChangeBackGroundImage extends WeatherState{}


