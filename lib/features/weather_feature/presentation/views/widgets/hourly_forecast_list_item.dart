import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class HourlyForecastSectionItem extends StatelessWidget {
  const HourlyForecastSectionItem({Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    List<HourlyForecastItemDetail> items = const [
      HourlyForecastItemDetail(
          degree: '17',
          hour: '2',
          humidityDegree: '4',
          iconUrl: 'http://openweathermap.org/img/wn/10d@2x.png'),
      HourlyForecastItemDetail(
          degree: '17',
          hour: '2',
          humidityDegree: '4',
          iconUrl: 'http://openweathermap.org/img/wn/10d@2x.png'),
      HourlyForecastItemDetail(
          degree: '17',
          hour: '2',
          humidityDegree: '4',
          iconUrl: 'http://openweathermap.org/img/wn/10d@2x.png'),
      HourlyForecastItemDetail(
          degree: '17',
          hour: '2',
          humidityDegree: '4',
          iconUrl: 'http://openweathermap.org/img/wn/10d@2x.png'),
    ];
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
            SizedBox(height: 200,
              child: HourlyForecastItemList(items: items),
            )
          ],
        ),
      ),
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
        separatorBuilder: (context, index) => Container(width: 1,color: Colors.grey,
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
        Text(hourlyForecastItemDetail.degree),
        Image(image: NetworkImage(hourlyForecastItemDetail.iconUrl)),
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