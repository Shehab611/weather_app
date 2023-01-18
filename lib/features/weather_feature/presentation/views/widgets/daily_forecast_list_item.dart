import 'package:flutter/material.dart';

import '../../../../../core/styles.dart';

class DailyForecastSectionItem extends StatelessWidget {
  const DailyForecastSectionItem({Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    List<DailyForecastItemDetail> items = const [
      DailyForecastItemDetail(date: 'thu 19',
          degree: '17',
          hour: '2',
          humidityDegree: '4',
          iconUrl: 'http://openweathermap.org/img/wn/10d@2x.png'),
      DailyForecastItemDetail(date: 'thu 19',
          degree: '17',
          hour: '2',
          humidityDegree: '4',
          iconUrl: 'http://openweathermap.org/img/wn/10d@2x.png'),
      DailyForecastItemDetail(date: 'thu 19',
          degree: '17',
          hour: '2',
          humidityDegree: '4',
          iconUrl: 'http://openweathermap.org/img/wn/10d@2x.png'),
      DailyForecastItemDetail(date: 'thu 19',
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
            const Text('Daily Forecast', style: Styles.textStyle25),
            const SizedBox(
              height: 30,
            ),
            SizedBox(height: 200,
              child: DailyForecastItemList(items: items),
            )
          ],
        ),
      ),
    );
  }
}

class DailyForecastItemList extends StatelessWidget {
  const DailyForecastItemList({Key? key, required this.items})
      : super(key: key);
  final List<DailyForecastItemDetail> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            DailyForecastItem(hourlyForecastItemDetail: items[index]),
        separatorBuilder: (context, index) => Container(width: 1,color: Colors.grey,
        ),
        itemCount: items.length);
  }
}

class DailyForecastItem extends StatelessWidget {
  const DailyForecastItem({Key? key, required this.hourlyForecastItemDetail})
      : super(key: key);
  final DailyForecastItemDetail hourlyForecastItemDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(hourlyForecastItemDetail.date),
        const SizedBox(
          height: 15,
        ),
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

class DailyForecastItemDetail {
  const DailyForecastItemDetail( {required this.date,
    required this.hour,
    required this.degree,
    required this.humidityDegree,
    required this.iconUrl,
  });

  final String hour;
  final String date;
  final String degree;
  final String humidityDegree;
  final String iconUrl;
}