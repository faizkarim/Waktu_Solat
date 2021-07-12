import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:waktusolat/controller/prayer_controller.dart';
import 'package:waktusolat/screens/share_widgets/app_prayer_card.dart';
import 'package:waktusolat/screens/share_widgets/app_timer.dart';
import 'package:waktusolat/utils/app_notification_service.dart';
import 'package:waktusolat/utils/app_size.dart';
import 'package:get/get.dart';

class PrayerTime extends StatefulWidget {
  @override
  _PrayerTimeState createState() => _PrayerTimeState();
}

class _PrayerTimeState extends State<PrayerTime> {
  PrayerController prayerController = Get.put(PrayerController());

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await prayerController.getPrayerTime();
    });
  }

  void onEnd() {
    prayerController.getPrayerTime();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(AppSize.spaceX16),
        margin: EdgeInsets.only(top: AppSize.tabHeight(context)),
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // FlatButton(
              //   onPressed: () async => await AppNotificationService()
              //       .showNotification(prayerController.checkPrayerName()),
              //   child: Text('data'),
              // ),
              CountdownTimer(
                controller: prayerController.countdownTimerController.value,
                endTime: prayerController.endTime.value,
                onEnd: onEnd,
                widgetBuilder: (context, time) {
                  return time == null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppTimer(time: "00"),
                            appColon(),
                            AppTimer(time: "00"),
                            appColon(),
                            AppTimer(time: "00"),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppTimer(
                              time: time.hours == null
                                  ? "00"
                                  : time.hours.toString().padLeft(2, '0') ??
                                      "00",
                            ),
                            appColon(),
                            AppTimer(
                              time: time.min == null
                                  ? "00"
                                  : time.min.toString().padLeft(2, '0'),
                            ),
                            appColon(),
                            AppTimer(
                              time: time.sec == null
                                  ? "00"
                                  : time.sec.toString().padLeft(2, '0') ?? "00",
                            ),
                          ],
                        );
                },
              ),
              Center(
                child: Text(
                  'Sebelum waktu seterusnya',
                ),
              ),
              SizedBox(
                height: AppSize.spaceX16,
              ),
              SizedBox(
                height: AppSize.spaceX16,
              ),
              AppPrayerCard(
                prayer: prayerController.prayer.value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget appColon() {
  return Text(
    ':',
    style: TextStyle(
      fontSize: AppSize.fontLargeX48,
      fontWeight: FontWeight.bold,
    ),
  );
}
