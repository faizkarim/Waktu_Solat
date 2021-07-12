import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AppNotification {
  static const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    '123456',
    'waktu_solat',
    '',
    importance: Importance.max,
    priority: Priority.high,
    showWhen: false,
    icon: "masjid_logo",
    enableVibration: true,
    styleInformation: BigTextStyleInformation(''),
  );

  static const IOSNotificationDetails iosPlatformChannelSpecifics =
      IOSNotificationDetails();

  static const NotificationDetails platformChannelSpecifics =
      NotificationDetails(
    android: androidPlatformChannelSpecifics,
    iOS: iosPlatformChannelSpecifics,
  );
}
