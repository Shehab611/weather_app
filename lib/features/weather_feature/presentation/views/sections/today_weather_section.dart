import 'package:flutter/material.dart';


import '../widgets/today_weather_content_data.dart';

class TodayWeatherSection extends StatelessWidget {
  const TodayWeatherSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(
            image: AssetImage('assets/clear_sky_with_sun.jpg'),
            fit: BoxFit.fill),
      ),
      child:const TodayWeatherContentData(),
    );
  }
}
