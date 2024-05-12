// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'etc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Etc _$EtcFromJson(Map<String, dynamic> json) => Etc(
      sunrise: Etc._intToDateTimeJson((json['sunrise'] as num?)?.toInt()),
      sunset: Etc._intToDateTimeJson((json['sunset'] as num?)?.toInt()),
      countryCode: json['country'] as String?,
    );

Map<String, dynamic> _$EtcToJson(Etc instance) => <String, dynamic>{
      'sunrise': Etc._dateTimeToInt(instance.sunrise),
      'sunset': Etc._dateTimeToInt(instance.sunset),
      'country': instance.countryCode,
    };
