import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather_feature/presentation/view_model_manger/current_weather_cubit/current_weather_cubit.dart';
import '../widgets/today_weather_content_data.dart';

class TodayWeatherSection extends StatelessWidget {
  const TodayWeatherSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWeatherCubit, CurrentWeatherState>(
      builder: (context, state) {
        CurrentWeatherCubit cubit = BlocProvider.of(context);
      if(state is CurrentWeatherSuccess){

        return Container(
          width: double.infinity,
          height: MediaQuery
              .of(context)
              .size
              .height * .3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image:  DecorationImage(
                image: AssetImage(cubit.changeBackGroundImage(state.currentWeatherModel.weather.main)),
                fit: BoxFit.fill),
          ),
          child: const TodayWeatherContentData(),
        );
      }
      else if (state is CurrentWeatherFailure) {
        return Center(
          child: Text(state.errMessage),
        );
      }
      else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      },
    );
  }
}
