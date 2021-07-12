import 'package:flutter/material.dart';
import 'package:waktusolat/data/model/prayer.dart';
import 'package:waktusolat/utils/app_size.dart';
import 'package:weather_icons/weather_icons.dart';

class AppPrayerCard extends StatelessWidget {
  final Prayer prayer;

  AppPrayerCard({
    this.prayer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.widthScreen(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: AppSize.widthScreen(context),
            decoration: BoxDecoration(
              color: Colors.amber.withOpacity(0.2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6),
                topRight: Radius.circular(6),
              ),
            ),
            padding: EdgeInsets.all(AppSize.spaceX1),
            child: Column(
              children: [
                Text(
                  this.prayer.masihi ?? '',
                  style: TextStyle(
                    color: Colors.amber,
                  ),
                ),
                SizedBox(
                  height: AppSize.space,
                ),
                Text(this.prayer.hijrah ?? ''),
              ],
            ),
          ),
          IgnorePointer(
            child: GridView.count(
              shrinkWrap: true,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              children: [
                appPrayerTile(
                  prayerName: "Subuh",
                  prayerTime: this.prayer.subuh,
                  icon: WeatherIcons.sunrise,
                ),
                appPrayerTile(
                  prayerName: "Syuruk",
                  prayerTime: this.prayer.syuruk,
                  icon: WeatherIcons.sunrise,
                ),
                appPrayerTile(
                  prayerName: "Zohor",
                  prayerTime: this.prayer.zohor,
                  icon: WeatherIcons.day_sunny,
                ),
                appPrayerTile(
                  prayerName: "Asar",
                  prayerTime: this.prayer.asar,
                  icon: WeatherIcons.day_cloudy,
                ),
                appPrayerTile(
                  prayerName: "Maghrib",
                  prayerTime: this.prayer.maghrib,
                  icon: WeatherIcons.sunset,
                ),
                appPrayerTile(
                  prayerName: "Isyak",
                  prayerTime: this.prayer.isyak,
                  icon: WeatherIcons.night_clear,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget appPrayerTile({prayerName, prayerTime, icon}) {
  return Container(
    padding: const EdgeInsets.all(8),
    child: Column(
      children: [
        Icon(icon),
        SizedBox(
          height: AppSize.spaceX1,
        ),
        Text(
          prayerName ?? '',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        SizedBox(
          height: AppSize.space,
        ),
        Text(
          prayerTime ?? '',
          style: TextStyle(
            fontSize: AppSize.fontLarge,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
