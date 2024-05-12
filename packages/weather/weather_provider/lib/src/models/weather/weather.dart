import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

/// {@template weather}
/// Weather
/// {@endtemplate}
@JsonSerializable()
class Weather extends Equatable {
  /// {@macro weather}
  const Weather({
    this.id,
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
    String? weather,
    String? description,
    String? icon,
  }) {
    return Weather(
      id: id ?? this.id,
      weather: weather ?? this.weather,
      description: description ?? this.description,
      icon: icon ?? this.icon,
    );
  }

  @override
  List<Object?> get props => [
        id,
        weather,
        description,
        icon,
      ];

  /// Creates a Json map from a Weather
  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  /// Creates a toString() override for Weather
  @override
  String toString() => 'Weather(id: $id, weather: $weather, '
      'description: $description, icon: $icon)';
}
