import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets/weather_view_body.dart';

class WeatherHome extends StatelessWidget {
  const WeatherHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 40,
        leading: IconButton(icon: const Icon(Icons.search_rounded),onPressed: (){}),
        title:Row(
          children: const[
            Icon(FontAwesomeIcons.locationArrow),
             Text('Sherouk City , Cairo',),
          ],
        ),
      ),
      body: const WeatherViewBody(),
    );
  }
}


