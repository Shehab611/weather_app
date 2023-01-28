import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../search_feature/presentation/views/search_widget.dart';
import '../../../data/repo/weather_home_repo.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  changeCityName(City city) {
    emit(WeatherSuccess(cityName: city.cityName));
  }

  showSearchPage(context) async {
    showSearch(context: context, delegate: CustomSearchWidgetDelegate());
    emit(WeatherShowSearch());
  }


}
