// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_main_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherMainDetails _$WeatherMainDetailsFromJson(Map<String, dynamic> json) =>
    WeatherMainDetails(
      temperature: json['temp'] as num?,
      feelsLike: json['feels_like'] as num?,
      minimumTemperature: json['temp_min'] as num?,
      maximumTemperature: json['temp_max'] as num?,
      pressure: json['pressure'] as num?,
      humidity: json['humidity'] as num?,
    );

Map<String, dynamic> _$WeatherMainDetailsToJson(WeatherMainDetails instance) =>
    <String, dynamic>{
      'temp': instance.temperature,
      'feels_like': instance.feelsLike,
      'temp_min': instance.minimumTemperature,
      'temp_max': instance.maximumTemperature,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };
