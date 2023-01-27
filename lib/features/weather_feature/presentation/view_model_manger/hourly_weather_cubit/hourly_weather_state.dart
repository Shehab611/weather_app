part of 'hourly_weather_cubit.dart';

abstract class HourlyWeatherState extends Equatable {
  const HourlyWeatherState();
  @override
  List<Object> get props => [];
}

class HourlyWeatherInitial extends HourlyWeatherState {}
class HourlyWeatherLoading extends HourlyWeatherState {}
class HourlyWeatherFailure extends HourlyWeatherState {
  final String errMessage;
  const HourlyWeatherFailure(this.errMessage);
}
class HourlyWeatherSuccess extends HourlyWeatherState {
  final List<HourlyWeatherModel> currentWeatherModel;
  const HourlyWeatherSuccess(this.currentWeatherModel);
}
