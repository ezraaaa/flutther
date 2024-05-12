// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wind.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wind _$WindFromJson(Map<String, dynamic> json) => Wind(
      speed: json['speed'] as num?,
      degrees: json['deg'] as num?,
      gust: json['gust'] as num?,
    );

Map<String, dynamic> _$WindToJson(Wind instance) => <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.degrees,
      'gust': instance.gust,
    };
