import 'package:flutter/material.dart';

class TodayWeatherDetailItemList extends StatelessWidget {
  const TodayWeatherDetailItemList({Key? key, required this.items,})
      : super(key: key);
final List<TodayWeatherDetailItemData> items;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
        physics:const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) =>
            TodayWeatherDetailItem(
                todayWeatherDetailItemData:items[index] ),
        separatorBuilder: (context, index) =>
           const Divider(
              color: Colors.black,
            ),
        itemCount: items.length);
  }
}

class TodayWeatherDetailItem extends StatelessWidget {
  const TodayWeatherDetailItem(
      {Key? key, required this.todayWeatherDetailItemData})
      : super(key: key);

  final TodayWeatherDetailItemData todayWeatherDetailItemData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(todayWeatherDetailItemData.detailIcon),
        const SizedBox(
          width: 5,
        ),
        Text(todayWeatherDetailItemData.detailName),
        const Spacer(),
        Text(todayWeatherDetailItemData.detailValue)
      ],
    );
  }
}

class TodayWeatherDetailItemData {
  final String detailName;
  final String detailValue;
  final IconData detailIcon;

  TodayWeatherDetailItemData({required this.detailName,
    required this.detailValue,
    required this.detailIcon});
}
