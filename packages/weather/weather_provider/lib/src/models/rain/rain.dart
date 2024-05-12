import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rain.g.dart';

/// {@template rain}
/// Rain description
/// {@endtemplate}
@JsonSerializable()
class Rain extends Equatable {
  /// {@macro rain}
  const Rain({
    this.oneHour,
    this.threeHours,
  });

  /// Creates a Rain from Json map
  factory Rain.fromJson(Map<String, dynamic> data) => _$RainFromJson(data);

  /// 1 hour
  /// In mm
  @JsonKey(name: '1h')
  final num? oneHour;

  /// 3 hours
  /// In mm
  @JsonKey(name: '3h')
  final num? threeHours;

  /// Creates a copy of the current Rain with property changes
  Rain copyWith({
    num? oneHour,
    num? threeHours,
  }) {
    return Rain(
      oneHour: oneHour ?? this.oneHour,
      threeHours: threeHours ?? this.threeHours,
    );
  }

  @override
  List<Object?> get props => [
        oneHour,
        threeHours,
      ];

  /// Creates a Json map from a Rain
  Map<String, dynamic> toJson() => _$RainToJson(this);

  /// Creates a toString() override for Rain
  @override
  String toString() => 'Rain(oneHour: $oneHour, threeHours: $threeHours)';
}
