import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coordinates.g.dart';

/// {@template coordinates}
/// Coordinates description
/// {@endtemplate}
@JsonSerializable()
class Coordinates extends Equatable {
  /// {@macro coordinates}
  const Coordinates({
    this.latitude,
    this.longitude,
  });

  /// Creates a Coordinates from Json map
  factory Coordinates.fromJson(Map<String, dynamic> data) =>
      _$CoordinatesFromJson(data);

  /// Latitude
  @JsonKey(name: 'lat')
  final num? latitude;

  /// Longitude
  @JsonKey(name: 'lon')
  final num? longitude;

  /// Creates a copy of the current Coordinates with property changes
  Coordinates copyWith({
    num? latitude,
    num? longitude,
  }) {
    return Coordinates(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  @override
  List<Object?> get props => [
        latitude,
        longitude,
      ];

  /// Creates a Json map from a Coordinates
  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);

  /// Creates a toString() override for Coordinates
  @override
  String toString() =>
      'Coordinates(latitude: $latitude, longitude: $longitude)';
}
