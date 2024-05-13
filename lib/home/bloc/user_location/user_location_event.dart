part of 'user_location_bloc.dart';

sealed class UserLocationEvent extends Equatable {
  const UserLocationEvent();
}

class GetLocationPermission extends UserLocationEvent {
  const GetLocationPermission({this.forceRequestPermission = false});

  final bool forceRequestPermission;

  @override
  List<Object> get props => [forceRequestPermission];
}

class GetUserLocation extends UserLocationEvent {
  @override
  List<Object> get props => [];
}

class UserLocationUpdated extends UserLocationEvent {
  const UserLocationUpdated(this.currentLocation);

  final Position currentLocation;

  @override
  List<Object?> get props => [currentLocation];
}
