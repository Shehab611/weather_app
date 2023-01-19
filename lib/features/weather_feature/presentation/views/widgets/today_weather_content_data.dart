import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
class TodayWeatherContentData extends StatelessWidget {
  const TodayWeatherContentData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                '17 °',
                style: Styles.textStyle80,
                textAlign: TextAlign.center,
              ),
              Spacer(),
              Text(
                'Cloudy',
                style:Styles.textStyle20 ,
              ),
              Text(
                'Feels Like 17 °',
                style:Styles.textStyle20 ,
              ),
              Spacer(),
              Text(
                'Day 17 °',
                style:Styles.textStyle20 ,
              ),
              Text(
                'Night 17 °',
                style:Styles.textStyle20 ,
              ),
            ],
          ),
          const Image(
            image: NetworkImage('http://openweathermap.org/img/wn/10d@2x.png'),
          ),
        ],
      ),
    );
  }
}
