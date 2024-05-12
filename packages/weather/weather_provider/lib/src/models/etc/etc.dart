import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'etc.g.dart';

/// {@template etc}
/// Etc description
/// {@endtemplate}
@JsonSerializable()
class Etc extends Equatable {
  /// {@macro etc}
  const Etc({
    required this.sunrise,
    required this.sunset,
    required this.countryCode,
  });

  /// Creates a Etc from Json map
  factory Etc.fromJson(Map<String, dynamic> data) => _$EtcFromJson(data);

  /// A description for sunrise
  @JsonKey(
    name: 'sunrise',
    fromJson: _intToDateTimeJson,
    toJson: _dateTimeToInt,
  )
  final DateTime? sunrise;

  /// A description for sunset
  @JsonKey(name: 'sunset', fromJson: _intToDateTimeJson, toJson: _dateTimeToInt)
  final DateTime? sunset;

  /// Country code
  /// Eg. GB, SG
  @JsonKey(name: 'country')
  final String? countryCode;

  /// Creates a copy of the current Etc with property changes
  Etc copyWith({
    DateTime? sunrise,
    DateTime? sunset,
    String? countryCode,
  }) {
    return Etc(
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
      countryCode: countryCode ?? this.countryCode,
    );
  }

  @override
  List<Object?> get props => [
        sunrise,
        sunset,
        countryCode,
      ];

  /// Creates a Json map from a Etc
  Map<String, dynamic> toJson() => _$EtcToJson(this);

  static DateTime? _intToDateTimeJson(int? int) =>
      int != null ? DateTime.fromMillisecondsSinceEpoch(int) : null;

  static int _dateTimeToInt(DateTime? time) =>
      time != null ? time.millisecondsSinceEpoch : 0;

  /// Creates a toString() override for Etc
  @override
  String toString() =>
      'Etc(sunrise: $sunrise, sunset: $sunset, countryCode: $countryCode)';
}
