import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather_feature/presentation/view_model_manger/current_weather_cubit/current_weather_cubit.dart';
import '../../../../../core/utils/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TodayWeatherContentData extends StatelessWidget {
  const TodayWeatherContentData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<CurrentWeatherCubit, CurrentWeatherState>(
        builder: (context, state) {
          if (state is CurrentWeatherSuccess) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '${state.currentWeatherModel.temp} °',
                      style: Styles.textStyle50,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      state.currentWeatherModel.weather.main,
                      style: Styles.textStyle20,
                    ),
                    Text(
                      'Feels Like ${state.currentWeatherModel.feelsLike} °',
                      style: Styles.textStyle20,
                    ),
                  ],
                ),
                CachedNetworkImage(
                  imageUrl:
                      'http://openweathermap.org/img/wn/${state.currentWeatherModel.weather.icon}.png',
                  fit: BoxFit.fill,
                  width: 100,
                  height: 100,placeholder: (context, url) => const CircularProgressIndicator(),
                ),
              ],
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
      ),
    );
  }
}
