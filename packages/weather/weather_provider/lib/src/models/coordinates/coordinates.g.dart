// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) => Coordinates(
      latitude: json['lat'] as num?,
      longitude: json['lon'] as num?,
    );

Map<String, dynamic> _$CoordinatesToJson(Coordinates instance) =>
    <String, dynamic>{
      'lat': instance.latitude,
      'lon': instance.longitude,
    };
