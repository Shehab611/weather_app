import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/styles.dart';
import '../widgets/today_weather_detail_item.dart';

class TodayWeatherDetailsSection extends StatelessWidget {
  const TodayWeatherDetailsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TodayWeatherDetailItemData> items = [
      TodayWeatherDetailItemData(
          detailName: 'Wind',
          detailValue: '158',
          detailIcon: Icons.air_rounded),
      TodayWeatherDetailItemData(
          detailName: 'Pressure',
          detailValue: '158',
          detailIcon: Icons.compress_outlined),
      TodayWeatherDetailItemData(
          detailName: 'Humidity',
          detailValue: '158',
          detailIcon: FontAwesomeIcons.droplet),
      TodayWeatherDetailItemData(
          detailName: 'Dew Point',
          detailValue: '158',
          detailIcon: Icons.water_drop_outlined),
      TodayWeatherDetailItemData(
          detailName: 'SunRise',
          detailValue: '158',
          detailIcon: FontAwesomeIcons.solidSun),
      TodayWeatherDetailItemData(
          detailName: 'SunSet',
          detailValue: '158',
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
            const Text('Today\'s Details', style: Styles.textStyle25),
            const SizedBox(
              height: 20,
            ),
            TodayWeatherDetailItemList(items: items),
          ],
        ),
      ),
    );
  }
}
