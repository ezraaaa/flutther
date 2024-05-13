import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

part 'user_location_event.dart';
part 'user_location_state.dart';

class UserLocationBloc extends Bloc<UserLocationEvent, UserLocationState> {
  UserLocationBloc() : super(const UserLocationState()) {
    on<GetLocationPermission>(_onGetLocationPermission);
    on<GetUserLocation>(_onGetUserLocation);
    on<UserLocationUpdated>(_onUserLocationUpdated);
  }

  StreamSubscription<Position>? _currentLocationStreamSubscription;

  Future<void> _onGetLocationPermission(
    GetLocationPermission event,
    Emitter<UserLocationState> emit,
  ) async {
    emit(state.copyWith(status: UserLocationStatus.inProgress));

    try {
      final permission = await Permission.location.request();

      switch (permission) {
        case PermissionStatus.restricted:
        case PermissionStatus.limited:
        case PermissionStatus.denied:
        case PermissionStatus.permanentlyDenied:
          if (state.requestPermissionCount < 1 ||
              event.forceRequestPermission == true) {
            add(const GetLocationPermission());
            emit(
              state.copyWith(
                requestPermissionCount: state.requestPermissionCount + 1,
              ),
            );
          } else {
            emit(
              state.copyWith(
                status: UserLocationStatus.failure,
                errorCode: 'location-permission-denied',
              ),
            );
          }
        case PermissionStatus.granted:
        case PermissionStatus.provisional:
          add(GetUserLocation());
      }
    } catch (error) {
      emit(
        state.copyWith(
          status: UserLocationStatus.failure,
          errorCode: 'location-service-unavailable',
        ),
      );
    }
  }

  Future<void> _onGetUserLocation(
    GetUserLocation event,
    Emitter<UserLocationState> emit,
  ) async {
    try {
      final lastKnownLocation = await Geolocator.getLastKnownPosition();
      if (lastKnownLocation != null) {
        add(UserLocationUpdated(lastKnownLocation));
      }

      await _currentLocationStreamSubscription?.cancel();
      _currentLocationStreamSubscription = Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
          distanceFilter: 100,
        ),
      ).listen((currentLocation) {
        add(UserLocationUpdated(currentLocation));
      });
    } catch (error) {
      emit(
        state.copyWith(
          status: UserLocationStatus.failure,
          errorCode: error.toString(),
        ),
      );
    }
  }

  Future<void> _onUserLocationUpdated(
    UserLocationUpdated event,
    Emitter<UserLocationState> emit,
  ) async {
    final latitude = event.currentLocation.latitude;
    final longitude = event.currentLocation.longitude;

    final places = await placemarkFromCoordinates(latitude, longitude);

    emit(
      state.copyWith(
        places: places,
        currentLocation: event.currentLocation,
        status: UserLocationStatus.success,
      ),
    );
  }

  @override
  Future<void> close() async {
    await _currentLocationStreamSubscription?.cancel();
    return super.close();
  }
}
