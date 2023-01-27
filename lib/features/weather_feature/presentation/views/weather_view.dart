import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../search_feature/presentation/views/search_widget.dart';
import 'widgets/weather_view_body.dart';

class WeatherHome extends StatefulWidget {
  const WeatherHome({
    super.key,
  });

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 40,
        title: Row(
          children: const [
            Icon(FontAwesomeIcons.locationArrow),
            Text(
              'Sherouk City , Cairo',
            ),
          ],
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.search_rounded),
              onPressed: () {
                setState(() {
                  showSearch(
                      context: context, delegate: CustomSearchWidgetDelegate());
                });
              }),
        ],
      ),
      body: const WeatherViewBody(),
      // bottomNavigationBar: const CustomizedBottomNavigationItem(),
    );
  }
}
