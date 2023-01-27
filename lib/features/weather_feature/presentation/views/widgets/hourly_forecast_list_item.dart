import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather_feature/presentation/view_model_manger/hourly_weather_cubit/hourly_weather_cubit.dart';

import '../../../../../core/utils/styles.dart';

class HourlyForecastSectionItem extends StatelessWidget {
  const HourlyForecastSectionItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HourlyWeatherCubit, HourlyWeatherState>(
      builder: (context, state) {
        if (state is HourlyWeatherSuccess) {
          List<HourlyForecastItemDetail> items = List.generate(
              state.currentWeatherModel.length,
              (index) => HourlyForecastItemDetail(
                  humidityDegree:
                      state.currentWeatherModel[index].humidity.toString(),
                  hour: state.currentWeatherModel[index].hour,
                  degree: state.currentWeatherModel[index].temp.toString(),
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
                  const Text('Hourly Forecast', style: Styles.textStyle25),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 150,
                    child: HourlyForecastItemList(items: items),
                  )
                ],
              ),
            ),
          );
        } else if (state is HourlyWeatherFailure) {
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

class HourlyForecastItemList extends StatelessWidget {
  const HourlyForecastItemList({Key? key, required this.items})
      : super(key: key);
  final List<HourlyForecastItemDetail> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            HourlyForecastItem(hourlyForecastItemDetail: items[index]),
        separatorBuilder: (context, index) => Container(
              width: 1,
              color: Colors.grey,
            ),
        itemCount: items.length);
  }
}

class HourlyForecastItem extends StatelessWidget {
  const HourlyForecastItem({Key? key, required this.hourlyForecastItemDetail})
      : super(key: key);
  final HourlyForecastItemDetail hourlyForecastItemDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(hourlyForecastItemDetail.hour),
        const SizedBox(
          height: 15,
        ),
        Text('${hourlyForecastItemDetail.degree} °'),
        CachedNetworkImage(
          imageUrl:'http://openweathermap.org/img/wn/${hourlyForecastItemDetail.iconUrl}.png',
          height: 70,width: 70,fit: BoxFit.fitWidth,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
        Text('${hourlyForecastItemDetail.humidityDegree} %'),
      ],
    );
  }
}

class HourlyForecastItemDetail {
  const HourlyForecastItemDetail({
    required this.hour,
    required this.degree,
    required this.humidityDegree,
    required this.iconUrl,
  });

  final String hour;
  final String degree;
  final String humidityDegree;
  final String iconUrl;
}
