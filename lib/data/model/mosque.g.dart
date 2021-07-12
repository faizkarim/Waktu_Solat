// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mosque.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mosque _$MosqueFromJson(Map<String, dynamic> json) {
  return Mosque(
    lat: json['lat'] as String,
    long: json['long'] as String,
    distance: json['distance'] as String,
    locationData: (json['locationData'] as List)
        ?.map((e) =>
            e == null ? null : LocationData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    serverTime: json['serverTime'] as String,
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$MosqueToJson(Mosque instance) => <String, dynamic>{
      'lat': instance.lat,
      'long': instance.long,
      'distance': instance.distance,
      'locationData': instance.locationData,
      'serverTime': instance.serverTime,
      'status': instance.status,
    };
