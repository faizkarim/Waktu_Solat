import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/route_manager.dart';
import 'package:waktusolat/screens/home.dart';
import 'package:waktusolat/screens/mosque.dart';
import 'package:waktusolat/utils/config/app_notification.dart';

class AppNotificationService {
  static final AppNotificationService _appNotificationService =
      AppNotificationService._internal();

  factory AppNotificationService() {
    return _appNotificationService;
  }

  AppNotificationService._internal();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('masjid_logo');

    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
      macOS: null,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: selectNotification,
    );
  }

  Future selectNotification(String payload) async {
    Get.to(() => Home(selectedIndex: 2));
  }

  showNotification(String prayerName) async {
    await flutterLocalNotificationsPlugin.show(
      0,
      'Jom Solat!',
      'Telah masuk waktu solat fardhu ${prayerName ?? ""} bagi kawasan Pulau Pinang dan kawasan sama waktu dengannya.',
      AppNotification.platformChannelSpecifics,
      payload: 'data',
    );
  }

  Future onDidReceiveLocalNotification(
    int id,
    String title,
    String body,
    String payload,
  ) async {
    print('object');
  }
}
