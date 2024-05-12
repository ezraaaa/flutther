import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'clouds.g.dart';

/// {@template clouds}
/// Clouds description
/// {@endtemplate}
@JsonSerializable()
class Clouds extends Equatable {
  /// {@macro clouds}
  const Clouds({
    required this.cloudiness,
  });

  /// Creates a Clouds from Json map
  factory Clouds.fromJson(Map<String, dynamic> data) => _$CloudsFromJson(data);

  /// Percentage of cloudiness
  @JsonKey(name: 'all')
  final num cloudiness;

  /// Creates a copy of the current Clouds with property changes
  Clouds copyWith({
    num? cloudiness,
  }) {
    return Clouds(
      cloudiness: cloudiness ?? this.cloudiness,
    );
  }

  @override
  List<Object?> get props => [
        cloudiness,
      ];

  /// Creates a Json map from a Clouds
  Map<String, dynamic> toJson() => _$CloudsToJson(this);

  /// Creates a toString() override for Clouds
  @override
  String toString() => 'Clouds(cloudiness: $cloudiness)';
}
