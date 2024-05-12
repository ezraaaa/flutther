import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'snow.g.dart';

/// {@template snow}
/// Snow description
/// {@endtemplate}
@JsonSerializable()
class Snow extends Equatable {
  /// {@macro snow}
  const Snow({
    this.oneHour,
    this.threeHours,
  });

  /// Creates a Snow from Json map
  factory Snow.fromJson(Map<String, dynamic> data) => _$SnowFromJson(data);

  /// 1 hour
  /// In mm
  @JsonKey(name: '1h')
  final num? oneHour;

  /// 3 hours
  /// In mm
  @JsonKey(name: '3h')
  final num? threeHours;

  /// Creates a copy of the current Snow with property changes
  Snow copyWith({
    num? oneHour,
    num? threeHours,
  }) {
    return Snow(
      oneHour: oneHour ?? this.oneHour,
      threeHours: threeHours ?? this.threeHours,
    );
  }

  @override
  List<Object?> get props => [
        oneHour,
        threeHours,
      ];

  /// Creates a Json map from a Snow
  Map<String, dynamic> toJson() => _$SnowToJson(this);

  /// Creates a toString() override for Snow
  @override
  String toString() => 'Snow(oneHour: $oneHour, threeHours: $threeHours)';
}
