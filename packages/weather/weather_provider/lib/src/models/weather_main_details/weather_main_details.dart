import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_main_details.g.dart';

/// {@template weather_main_details}
/// WeatherMainDetails description
/// {@endtemplate}
@JsonSerializable()
class WeatherMainDetails extends Equatable {
  /// {@macro weather_main_details}
  const WeatherMainDetails({
    this.temperature,
    this.feelsLike,
    this.minimumTemperature,
    this.maximumTemperature,
    this.pressure,
    this.humidity,
  });

  /// Creates a WeatherMainDetails from Json map
  factory WeatherMainDetails.fromJson(Map<String, dynamic> data) =>
      _$WeatherMainDetailsFromJson(data);

  /// Temperature
  /// Metric: Celsius
  /// Imperial: Fahrenheit
  @JsonKey(name: 'temp')
  final num? temperature;

  /// Temperature but human's perception of weather
  /// Metric: Celsius
  /// Imperial: Fahrenheit
  @JsonKey(name: 'feels_like')
  final num? feelsLike;

  /// Minimum temperature at the moment
  @JsonKey(name: 'temp_min')
  final num? minimumTemperature;

  /// Maximum temperature at the moment
  @JsonKey(name: 'temp_max')
  final num? maximumTemperature;

  /// Atmospheric pressure on the sea level, hPa
  @JsonKey(name: 'pressure')
  final num? pressure;

  /// Humidity percentage
  @JsonKey(name: 'humidity')
  final num? humidity;

  /// Creates a copy of the current WeatherMainDetails with property changes
  WeatherMainDetails copyWith({
    num? temperature,
    num? feelsLike,
    num? minimumTemperature,
    num? maximumTemperature,
    num? pressure,
    num? humidity,
  }) {
    return WeatherMainDetails(
      temperature: temperature ?? this.temperature,
      feelsLike: feelsLike ?? this.feelsLike,
      minimumTemperature: minimumTemperature ?? this.minimumTemperature,
      maximumTemperature: maximumTemperature ?? this.maximumTemperature,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
    );
  }

  @override
  List<Object?> get props => [
        temperature,
        feelsLike,
        minimumTemperature,
        maximumTemperature,
        pressure,
        humidity,
      ];

  /// Creates a Json map from a WeatherMainDetails
  Map<String, dynamic> toJson() => _$WeatherMainDetailsToJson(this);

  /// Creates a toString() override for WeatherMainDetails
  @override
  String toString() => 'WeatherMainDetails(temperature: $temperature, '
      'feelsLike: $feelsLike,'
      ' minimumTemperature: $minimumTemperature, '
      'maximumTemperature: $maximumTemperature, '
      'pressure: $pressure, '
      'humidity: $humidity)';
}
