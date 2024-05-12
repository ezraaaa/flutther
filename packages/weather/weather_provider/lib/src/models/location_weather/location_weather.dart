import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_provider/weather_provider.dart';

part 'location_weather.g.dart';

/// {@template location_weather}
/// Location Weather description
/// {@endtemplate}
@JsonSerializable()
class LocationWeather extends Equatable {
  /// {@macro location_weather}
  const LocationWeather({
    this.coordinates,
    this.weather,
    this.mainDetails,
    this.visibility,
    this.wind,
    this.clouds,
    this.updatedAt,
    this.etc,
    this.rain,
    this.snow,
    this.code,
  });

  /// Creates a LocationWeather from Json map
  factory LocationWeather.fromJson(Map<String, dynamic> data) =>
      _$LocationWeatherFromJson(data);

  /// Coordinates of the location
  @JsonKey(name: 'coord')
  final Coordinates? coordinates;

  /// Weather
  final List<Weather>? weather;

  /// Weather main details
  @JsonKey(name: 'main')
  final WeatherMainDetails? mainDetails;

  /// Visibility in meters
  final num? visibility;

  /// Wind details
  final Wind? wind;

  /// Clouds
  final Clouds? clouds;

  /// Time of data calculation
  @JsonKey(name: 'dt', fromJson: _intToDateTimeJson, toJson: _dateTimeToInt)
  final DateTime? updatedAt;

  /// Etc details
  @JsonKey(name: 'sys')
  final Etc? etc;

  /// Rain details
  final Rain? rain;

  /// Snow details
  final Snow? snow;

  /// JSON status code
  @JsonKey(name: 'cod')
  final num? code;

  /// Creates a copy of the current LocationWeather with property changes
  LocationWeather copyWith({
    Coordinates? coordinates,
    List<Weather>? weather,
    WeatherMainDetails? mainDetails,
    num? visibility,
    Wind? wind,
    Clouds? clouds,
    DateTime? updatedAt,
    Etc? etc,
    num? code,
  }) {
    return LocationWeather(
      coordinates: coordinates ?? this.coordinates,
      weather: weather ?? this.weather,
      mainDetails: mainDetails ?? this.mainDetails,
      visibility: visibility ?? this.visibility,
      wind: wind ?? this.wind,
      clouds: clouds ?? this.clouds,
      updatedAt: updatedAt ?? this.updatedAt,
      etc: etc ?? this.etc,
      code: code ?? this.code,
    );
  }

  @override
  List<Object?> get props => [
        coordinates,
        weather,
        mainDetails,
        visibility,
        wind,
        clouds,
        updatedAt,
        etc,
        code,
      ];

  /// Creates a Json map from a Weather
  Map<String, dynamic> toJson() => _$LocationWeatherToJson(this);

  static DateTime? _intToDateTimeJson(int? int) =>
      int != null ? DateTime.fromMillisecondsSinceEpoch(int) : null;

  static int _dateTimeToInt(DateTime? time) =>
      time != null ? time.millisecondsSinceEpoch : 0;

  /// Empty LocationWeather
  static const empty = LocationWeather();

  /// Checks if LocationWeather is empty
  bool get isEmpty => this == LocationWeather.empty;

  /// Checks if LocationWeather is not empty
  bool get isNotEmpty => this != LocationWeather.empty;

  /// Creates a toString() override for Weather
  @override
  String toString() => 'LocationWeather('
      'coordinates: $coordinates, '
      'weather: $weather, '
      'mainDetails: $mainDetails, '
      'visibility: $visibility, '
      'wind: $wind, '
      'clouds: $clouds, '
      'updatedAt: $updatedAt, '
      'etc: $etc, '
      'code: $code'
      ')';
}
