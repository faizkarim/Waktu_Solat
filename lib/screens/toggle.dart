import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waktusolat/controller/prayer_controller.dart';
import 'package:waktusolat/screens/share_widgets/app_list_tile_switch.dart';
import 'package:waktusolat/utils/app_size.dart';
import 'package:weather_icons/weather_icons.dart';

class Toggle extends StatefulWidget {
  @override
  _ToggleState createState() => _ToggleState();
}

final prayerController = Get.put(PrayerController());

void onChange(val, toggleValue) {
  toggleValue(val);
}

class _ToggleState extends State<Toggle> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 16.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.spaceX16),
            child: Text(
              'Laungan Azan',
              style: TextStyle(
                fontSize: AppSize.fontLargeX3,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          AppListTileSwitch(
            title: "Subuh",
            toggleValue: prayerController.toggleSubuh.value,
            icon: WeatherIcons.sunrise,
            onChange: (val) => onChange(val, prayerController.toggleSubuh),
          ),
          AppListTileSwitch(
            title: "Zohor",
            toggleValue: prayerController.toggleZohor.value,
            icon: WeatherIcons.day_sunny,
            onChange: (val) => onChange(val, prayerController.toggleZohor),
          ),
          AppListTileSwitch(
            title: "Asar",
            toggleValue: prayerController.toggleAsar.value,
            icon: WeatherIcons.day_cloudy,
            onChange: (val) => onChange(val, prayerController.toggleAsar),
          ),
          AppListTileSwitch(
            title: "Maghrib",
            toggleValue: prayerController.toggleMaghrib.value,
            icon: WeatherIcons.sunset,
            onChange: (val) => onChange(val, prayerController.toggleMaghrib),
          ),
          AppListTileSwitch(
            title: "Isyak",
            toggleValue: prayerController.toggleIsyak.value,
            icon: WeatherIcons.night_clear,
            onChange: (val) => onChange(val, prayerController.toggleIsyak),
          ),
          FlatButton(
            onPressed: () => prayerController.offAzan(),
            child: Text("Off Azan"),
          ),
        ],
      ),
    );
  }
}
