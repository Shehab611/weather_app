import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather_feature/presentation/view_model_manger/daily_weather_cubit/daily_weather_cubit.dart';
import '../../../../../core/utils/styles.dart';

class DailyForecastSectionItem extends StatelessWidget {
  const DailyForecastSectionItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DailyWeatherCubit, DailyWeatherState>(
      builder: (context, state) {
        if (state is DailyWeatherSuccess) {
          List<DailyForecastItemDetail> items = List.generate(
              state.currentWeatherModel.length,
              (index) => DailyForecastItemDetail(
                  date: state.currentWeatherModel[index].date,
                  dayDegree:
                      state.currentWeatherModel[index].dayTemp.toString(),
                  nightDegree:
                      state.currentWeatherModel[index].nightTemp.toString(),
                  humidityDegree:
                      state.currentWeatherModel[index].humidity.toString(),
                  iconUrl: state.currentWeatherModel[index].icon));
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Daily Forecast', style: Styles.textStyle25),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 180,
                    child: DailyForecastItemList(items: items),
                  )
                ],
              ),
            ),
          );
        } else if (state is DailyWeatherFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class DailyForecastItemList extends StatelessWidget {
  const DailyForecastItemList({Key? key, required this.items})
      : super(key: key);
  final List<DailyForecastItemDetail> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            DailyForecastItem(hourlyForecastItemDetail: items[index]),
        separatorBuilder: (context, index) => Container(
              width: 1,
              color: Colors.grey,
            ),
        itemCount: items.length);
  }
}

class DailyForecastItem extends StatelessWidget {
  const DailyForecastItem({Key? key, required this.hourlyForecastItemDetail})
      : super(key: key);
  final DailyForecastItemDetail hourlyForecastItemDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(hourlyForecastItemDetail.date),
        const SizedBox(
          height: 15,
        ),
        Text('D ${hourlyForecastItemDetail.dayDegree} °'),
        const SizedBox(
          height: 15,
        ),
        Text('N ${hourlyForecastItemDetail.nightDegree} °'),
        CachedNetworkImage(
          imageUrl:
              'http://openweathermap.org/img/wn/${hourlyForecastItemDetail.iconUrl}.png',
          height: 70,
          width: 70,
          fit: BoxFit.fitWidth,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
        Text('${hourlyForecastItemDetail.humidityDegree} %'),
      ],
    );
  }
}

class DailyForecastItemDetail {
  const DailyForecastItemDetail({
    required this.date,
    required this.dayDegree,
    required this.nightDegree,
    required this.humidityDegree,
    required this.iconUrl,
  });

  final String date;
  final String dayDegree;
  final String nightDegree;
  final String humidityDegree;
  final String iconUrl;
}
