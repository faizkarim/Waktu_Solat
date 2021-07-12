import 'package:json_annotation/json_annotation.dart';
part 'prayer.g.dart';

@JsonSerializable()
class Prayer {
  String masihi;
  String hijrah;
  String imsak;
  String subuh;
  String syuruk;
  String zohor;
  String asar;
  String maghrib;
  String isyak;
  String imsak2;
  String subuh2;
  String syuruk2;
  String zohor2;
  String asar2;
  String maghrib2;
  String isyak2;

  Prayer({
    this.masihi,
    this.hijrah,
    this.imsak,
    this.subuh,
    this.syuruk,
    this.zohor,
    this.asar,
    this.maghrib,
    this.isyak,
    this.imsak2,
    this.subuh2,
    this.syuruk2,
    this.zohor2,
    this.asar2,
    this.maghrib2,
    this.isyak2,
  });

  factory Prayer.fromJson(Map<String, dynamic> json) => _$PrayerFromJson(json);

  Map<String, dynamic> toJson() => _$PrayerToJson(this);
}
