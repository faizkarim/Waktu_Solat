import 'package:flutter/material.dart';
import 'package:waktusolat/utils/app_size.dart';

class AppPrayerTime extends StatelessWidget {
  final String prayerName;
  final String prayerTime;

  AppPrayerTime({this.prayerName, this.prayerTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.widthScreen(context),
      padding: EdgeInsets.all(AppSize.spaceX16),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            this.prayerTime ?? '',
            style: TextStyle(
              fontSize: AppSize.fontLargeX6,
            ),
          ),
          Text('Asar'),
        ],
      ),
    );
  }
}
