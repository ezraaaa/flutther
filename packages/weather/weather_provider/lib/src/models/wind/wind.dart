import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wind.g.dart';

/// {@template wind}
/// Wind details
/// {@endtemplate}
@JsonSerializable()
class Wind extends Equatable {
  /// {@macro wind}
  const Wind({
    this.speed,
    this.degrees,
    this.gust,
  });

  /// Creates a Wind from Json map
  factory Wind.fromJson(Map<String, dynamic> data) => _$WindFromJson(data);

  /// Wind speed
  /// Metric: meter/sec
  /// Imperial: miles/hour
  final num? speed;

  /// Wind direction
  @JsonKey(name: 'deg')
  final num? degrees;

  /// Wind gust
  /// Metric: meter/sec
  /// Imperial: miles/hour
  final num? gust;

  /// Creates a copy of the current Wind with property changes
  Wind copyWith({
    num? speed,
    num? degrees,
    num? gust,
  }) {
    return Wind(
      speed: speed ?? this.speed,
      degrees: degrees ?? this.degrees,
      gust: gust ?? this.gust,
    );
  }

  @override
  List<Object?> get props => [
        speed,
        degrees,
        gust,
      ];

  /// Creates a Json map from a Wind
  Map<String, dynamic> toJson() => _$WindToJson(this);

  /// Creates a toString() override for Wind
  @override
  String toString() => 'Wind(speed: $speed, degrees: $degrees, gust: $gust)';
}
