import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/features/weather_feature/presentation/view_model_manger/current_weather_cubit/current_weather_cubit.dart';
import '../../../../../core/utils/styles.dart';
import '../widgets/today_weather_detail_item.dart';

class TodayWeatherDetailsSection extends StatelessWidget {
  const TodayWeatherDetailsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return BlocBuilder<CurrentWeatherCubit, CurrentWeatherState>(
      builder: (context, state) {
        if (state is CurrentWeatherSuccess) {

          List<TodayWeatherDetailItemData> items = [
            TodayWeatherDetailItemData(
                detailName: 'Wind',
                detailValue: state.currentWeatherModel.windSpeed.toString(),
                detailIcon: Icons.air_rounded),
            TodayWeatherDetailItemData(
                detailName: 'Pressure',
                detailValue: state.currentWeatherModel.pressure.toString(),
                detailIcon: Icons.compress_outlined),
            TodayWeatherDetailItemData(
                detailName: 'Humidity',
                detailValue:  state.currentWeatherModel.humidity.toString(),
                detailIcon: FontAwesomeIcons.droplet),
            TodayWeatherDetailItemData(
                detailName: 'Dew Point',
                detailValue:  state.currentWeatherModel.dewPoint.toString(),
                detailIcon: Icons.water_drop_outlined),
            TodayWeatherDetailItemData(
                detailName: 'SunRise',
                detailValue:  state.currentWeatherModel.sunrise,
                detailIcon: FontAwesomeIcons.solidSun),
            TodayWeatherDetailItemData(
                detailName: 'SunSet',
                detailValue:  state.currentWeatherModel.sunset,
                detailIcon: FontAwesomeIcons.cloudSun),
          ];
          return Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Today\'s Details ', style: Styles.textStyle25),
                  const SizedBox(
                    height: 20,
                  ),
                  TodayWeatherDetailItemList(items: items),
                ],
              ),
            ),
          );
        }
        else if (state is CurrentWeatherFailure) {
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
