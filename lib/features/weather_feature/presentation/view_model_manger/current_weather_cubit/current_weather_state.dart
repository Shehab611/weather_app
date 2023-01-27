part of 'current_weather_cubit.dart';

abstract class CurrentWeatherState extends Equatable {
  const CurrentWeatherState();
  @override
  List<Object> get props => [];
}

class CurrentWeatherInitial extends CurrentWeatherState {}
class CurrentWeatherLoading extends CurrentWeatherState {}
class CurrentWeatherFailure extends CurrentWeatherState {
  final String errMessage;
  const CurrentWeatherFailure(this.errMessage);
}
class CurrentWeatherSuccess extends CurrentWeatherState {
  final CurrentWeatherModel currentWeatherModel;
  const CurrentWeatherSuccess(this.currentWeatherModel);
}
