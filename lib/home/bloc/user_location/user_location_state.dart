part of 'user_location_bloc.dart';

enum UserLocationStatus { initial, inProgress, success, failure }

class UserLocationState extends Equatable {
  const UserLocationState({
    this.currentLocation,
    this.places = const [],
    this.requestPermissionCount = 0,
    this.status = UserLocationStatus.initial,
    this.errorCode,
  });

  final Position? currentLocation;
  final List<Placemark> places;
  final num requestPermissionCount;
  final String? errorCode;
  final UserLocationStatus status;

  @override
  List<Object?> get props =>
      [currentLocation, places, requestPermissionCount, status];

  UserLocationState copyWith({
    Position? currentLocation,
    List<Placemark>? places,
    num? requestPermissionCount,
    UserLocationStatus? status,
    String? errorCode,
  }) {
    return UserLocationState(
      currentLocation: currentLocation ?? this.currentLocation,
      places: places ?? this.places,
      requestPermissionCount:
          requestPermissionCount ?? this.requestPermissionCount,
      status: status ?? this.status,
      errorCode: errorCode,
    );
  }
}
