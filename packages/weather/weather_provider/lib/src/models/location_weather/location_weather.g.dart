// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationWeather _$LocationWeatherFromJson(Map<String, dynamic> json) =>
    LocationWeather(
      coordinates: json['coord'] == null
          ? null
          : Coordinates.fromJson(json['coord'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      mainDetails: json['main'] == null
          ? null
          : WeatherMainDetails.fromJson(json['main'] as Map<String, dynamic>),
      visibility: json['visibility'] as num?,
      wind: json['wind'] == null
          ? null
          : Wind.fromJson(json['wind'] as Map<String, dynamic>),
      clouds: json['clouds'] == null
          ? null
          : Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
      updatedAt:
          LocationWeather._intToDateTimeJson((json['dt'] as num?)?.toInt()),
      etc: json['sys'] == null
          ? null
          : Etc.fromJson(json['sys'] as Map<String, dynamic>),
      rain: json['rain'] == null
          ? null
          : Rain.fromJson(json['rain'] as Map<String, dynamic>),
      snow: json['snow'] == null
          ? null
          : Snow.fromJson(json['snow'] as Map<String, dynamic>),
      code: json['cod'] as num?,
    );

Map<String, dynamic> _$LocationWeatherToJson(LocationWeather instance) =>
    <String, dynamic>{
      'coord': instance.coordinates,
      'weather': instance.weather,
      'main': instance.mainDetails,
      'visibility': instance.visibility,
      'wind': instance.wind,
      'clouds': instance.clouds,
      'dt': LocationWeather._dateTimeToInt(instance.updatedAt),
      'sys': instance.etc,
      'rain': instance.rain,
      'snow': instance.snow,
      'cod': instance.code,
    };
