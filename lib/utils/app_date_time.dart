import 'package:intl/intl.dart';

class AppDateTime {
  static convertDateTime(String dateTime) {
    return DateFormat("yyyy-MM-dd hh:mm:ss").parse(dateTime);
  }

  // static getDateTimeBefore(List<DateTime> dateTimeList) {
  //   DateTime currentDateTime = DateTime.now();

  //   for (int i = 0; i < dateTimeList.length; i++) {
  //     if (currentDateTime.isBefore(dateTimeList[i])) {
  //       return (dateTimeList[i].hour * 60) + dateTimeList[i].minute;
  //     }
  //   }
  // }
}
