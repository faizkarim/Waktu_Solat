import 'package:flutter_countdown_timer/index.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:waktusolat/data/model/prayer.dart';
import 'package:waktusolat/data/repository/prayer_repository.dart';
import 'package:waktusolat/utils/app_date_time.dart';
import 'package:waktusolat/utils/app_notification_service.dart';

class PrayerController extends GetxController {
  PrayerRepository prayerRepository = PrayerRepository();
  final prayer = Prayer().obs;
  final endTime = 0.obs;
  final countdownTimerController = CountdownTimerController(endTime: 1).obs;
  final loading = false.obs;

  final toggleSubuh = false.obs;
  final toggleZohor = false.obs;
  final toggleAsar = false.obs;
  final toggleMaghrib = false.obs;
  final toggleIsyak = false.obs;

  // 0 - Subuh
  // 1 - Syuruk
  // 2 - Zohor
  // 3 - Asar
  // 4 - Maghrib
  // 5 - Isyak

  final waktuSekarang = 0.obs;

  AudioPlayer player;

  void onInit() {
    player = AudioPlayer();
    super.onInit();
  }

  getPrayerTime() async {
    Prayer data = await prayerRepository.getPrayerTime();
    if (data != null) {
      prayer(data);
      List<DateTime> dateTimeList = [];

      dateTimeList.add(AppDateTime.convertDateTime(prayer.value.subuh2));
      dateTimeList.add(AppDateTime.convertDateTime(prayer.value.syuruk2));
      dateTimeList.add(AppDateTime.convertDateTime(prayer.value.zohor2));
      dateTimeList.add(AppDateTime.convertDateTime(prayer.value.asar2));
      dateTimeList.add(AppDateTime.convertDateTime(prayer.value.maghrib2));
      dateTimeList.add(AppDateTime.convertDateTime(prayer.value.isyak2));

      DateTime currentDateTime = DateTime.now();

      for (int i = 0; i < dateTimeList.length; i++) {
        if (currentDateTime.isBefore(dateTimeList[i])) {
          waktuSekarang(i);
          endTime(dateTimeList[i].millisecondsSinceEpoch);
          countdownTimerController.value = CountdownTimerController(
            endTime: endTime.value,
            onEnd: onEnd,
          );
          i = dateTimeList.length;
        } else if (currentDateTime
            .isAfter(dateTimeList[dateTimeList.length - 1])) {
          endTime(0);
          countdownTimerController.value = CountdownTimerController(
            endTime: endTime.value,
          );
          i = dateTimeList.length;
        }
      }
    }
  }

  void onEnd() async {
    getPrayerTime();
    playAzan();
    AppNotificationService().showNotification(checkPrayerName());
  }

  void playAzan() async {
    player.setVolume(10.0);

    if (toggleSubuh.value && waktuSekarang.value == 0) {
      await player.setAsset('assets/audio/azan1.mp3');
      player.play();
    } else if (toggleZohor.value && waktuSekarang.value == 2) {
      await player.setAsset('assets/audio/azan1.mp3');
      player.play();
    } else if (toggleAsar.value && waktuSekarang.value == 3) {
      await player.setAsset('assets/audio/azan1.mp3');
      player.play();
    } else if (toggleMaghrib.value && waktuSekarang.value == 4) {
      await player.setAsset('assets/audio/azan1.mp3');
      player.play();
    } else if (toggleIsyak.value && waktuSekarang.value == 5) {
      await player.setAsset('assets/audio/azan1.mp3');
      player.play();
    } else {
      player.stop();
    }
  }

  offAzan() {
    player.stop();
  }

  String checkPrayerName() {
    switch (waktuSekarang.value) {
      case 0:
        return "Subuh";
        break;

      case 1:
        return "Syuruk";
        break;

      case 2:
        return "Zohor";
        break;

      case 3:
        return "Asar";
        break;

      case 4:
        return "Maghrib";
        break;

      case 5:
        return "Isyak";
        break;
      default:
        return "";
    }
  }
}
