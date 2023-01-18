import 'package:flutter/material.dart';
import '../sections/today_weather_details_section.dart';
import '../sections/today_weather_section.dart';
import 'daily_forecast_list_item.dart';
import 'hourly_forecast_list_item.dart';

class WeatherViewBody extends StatelessWidget {
  const WeatherViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding:  EdgeInsets.all(5.0),
            child: TodayWeatherSection(),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding:  EdgeInsets.all(5.0),
            child: TodayWeatherDetailsSection(),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding:  EdgeInsets.all(5.0),
            child:   HourlyForecastSectionItem(),

          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding:  EdgeInsets.all(5.0),
            child:   DailyForecastSectionItem(),

          ),
        ),
      ],
    );
  }
}
