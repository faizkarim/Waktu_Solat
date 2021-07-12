import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:waktusolat/data/model/mosque.dart';

class MosqueRepository {
  Future getNearestMosque(double latitude, double longitude) async {
    var response = await http.get(
      'https://www.e-solat.gov.my/index.php?r=esolatApi/nearestMosque&lat=$latitude&long=$longitude&dist=7',
      headers: {
        "Accept": "application/json",
      },
    );
    if (response.statusCode == 200) {
      final res = jsonDecode(response.body);
      return Mosque.fromJson(res);
    } else {
      return null;
    }
  }
}
