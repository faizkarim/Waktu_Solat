import 'package:flutter/material.dart';
import 'package:waktusolat/utils/app_size.dart';

class AppTimer extends StatelessWidget {
  final String time;
  AppTimer({this.time});

  @override
  Widget build(BuildContext context) {
    return Text(
      time ?? "00",
      style: TextStyle(
        fontSize: AppSize.fontLargeX48,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
