import "package:flutter/material.dart";
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:waktusolat/screens/home.dart';
import 'package:waktusolat/utils/app_notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppNotificationService().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Home(),
      builder: EasyLoading.init(),
    );
  }
}
