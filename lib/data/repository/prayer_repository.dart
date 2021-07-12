import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:waktusolat/data/model/prayer.dart';

class PrayerRepository {
  Future<Prayer> getPrayerTime() async {
    final response =
        await http.get('https://masjidpro.com/Masjid/waktu_solat.php?json=1');

    if (response.statusCode == 200) {
      final res = jsonDecode(response.body);
      return Prayer.fromJson(res['waktu_solat']);
    } else {
      return null;
    }
  }
}
