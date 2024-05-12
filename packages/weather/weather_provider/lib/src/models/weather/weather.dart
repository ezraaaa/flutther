import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

/// Types of weather
enum WeatherType {
  /// Unknown weather type
  unknown,

  /// Thunderstorm weather type
  thunderstorm,

  /// Drizzle weather type
  drizzle,

  /// Rain weather type
  rain,

  /// Snow weather type
  snow,

  /// Mist weather type
  mist,

  /// Smoke weather type
  smoke,

  /// Haze weather type
  haze,

  /// Dust weather type
  dust,

  /// Fog weather type
  fog,

  /// Sand weather type
  sand,

  /// Ash weather type
  ash,

  /// Squall weather type
  squall,

  /// Tornado weather type
  tornado,

  /// Clear weather type
  clear,

  /// Clouds weather type
  clouds,
}

/// {@template weather}
/// Weather
/// {@endtemplate}
@JsonSerializable()
class Weather extends Equatable {
  /// {@macro weather}
  const Weather({
    this.id,
    this.type,
    this.weather,
    this.description,
    this.icon,
  });

  /// Creates a Weather from Json map
  factory Weather.fromJson(Map<String, dynamic> data) =>
      _$WeatherFromJson(data);

  /// Weather ID code
  /// https://openweathermap.org/weather-conditions
  @JsonKey(name: 'id')
  final num? id;

  /// Weather type
  /// Convert id to enum
  final WeatherType? type;

  /// Group of weather parameters
  /// Eg. Rain, Snow, Clouds, Drizzle, Thunderstorm, Atmosphere, Clear
  @JsonKey(name: 'main')
  final String? weather;

  /// Description of the group of weather parameters
  @JsonKey(name: 'description')
  final String? description;

  /// Icon representing the group of weather parameters
  @JsonKey(name: 'icon')
  final String? icon;

  /// Creates a copy of the current Weather with property changes
  Weather copyWith({
    num? id,
    WeatherType? type,
    String? weather,
    String? description,
    String? icon,
  }) {
    return Weather(
      id: id ?? this.id,
      type: type ?? this.type,
      weather: weather ?? this.weather,
      description: description ?? this.description,
      icon: icon ?? this.icon,
    );
  }

  @override
  List<Object?> get props => [
        id,
        type,
        weather,
        description,
        icon,
      ];

  /// Creates a Json map from a Weather
  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  /// Creates a toString() override for Weather
  @override
  String toString() => 'Weather(id: $id, type: $type, weather: $weather, '
      'description: $description, icon: $icon)';
}
