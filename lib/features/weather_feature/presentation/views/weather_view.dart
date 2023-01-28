import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/features/weather_feature/presentation/view_model_manger/weather_cubit/weather_cubit.dart';
import '../../../search_feature/presentation/views/search_widget.dart';
import 'widgets/weather_view_body.dart';

class WeatherHome extends StatelessWidget {
  const WeatherHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherSuccess) {
          return Scaffold(
            appBar: AppBar(
              elevation: 40,
              title: Row(
                children: [
                  const Icon(FontAwesomeIcons.locationArrow),
                  const SizedBox(width: 7,),
                  Expanded(
                    child: Text(
                      state.cityName,
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                    icon: const Icon(Icons.search_rounded),
                    onPressed: () {
                    showSearch(context: context, delegate: CustomSearchWidgetDelegate());
                    }),
              ],
            ),
            body: const WeatherViewBody(),
            // bottomNavigationBar: const CustomizedBottomNavigationItem(),
          );
        }
        else if (state is WeatherFailure) {
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
