import 'package:json_annotation/json_annotation.dart';
import 'package:waktusolat/data/model/location_data.dart';

part 'mosque.g.dart';

@JsonSerializable()
class Mosque {
  String lat;
  String long;
  String distance;
  List<LocationData> locationData;
  String serverTime;
  String status;

  Mosque({
    this.lat,
    this.long,
    this.distance,
    this.locationData,
    this.serverTime,
    this.status,
  });

  factory Mosque.fromJson(Map<String, dynamic> json) => _$MosqueFromJson(json);

  Map<String, dynamic> toJson() => _$MosqueToJson(this);
}
