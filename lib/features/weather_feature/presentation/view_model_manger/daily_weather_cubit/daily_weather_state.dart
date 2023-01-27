part of 'daily_weather_cubit.dart';

abstract class DailyWeatherState extends Equatable {
  const DailyWeatherState();
  @override
  List<Object> get props => [];
}

class DailyWeatherInitial extends DailyWeatherState {}
class DailyWeatherLoading extends DailyWeatherState {}
class DailyWeatherFailure extends DailyWeatherState {
  final String errMessage;
  const DailyWeatherFailure(this.errMessage);
}
class DailyWeatherSuccess extends DailyWeatherState {
  final List<DailyWeatherModel> currentWeatherModel;
  const DailyWeatherSuccess(this.currentWeatherModel);
}