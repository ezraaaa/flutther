import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutther/home/home.dart';
import 'package:flutther/weather/weather.dart';

BlocListener<UserLocationBloc, UserLocationState> userLocationBlocListener() {
  return BlocListener<UserLocationBloc, UserLocationState>(
    listener: (context, state) {
      switch (state.status) {
        case UserLocationStatus.initial:
        case UserLocationStatus.inProgress:
        case UserLocationStatus.failure:
          break;
        case UserLocationStatus.success:
          final currentLocation = state.currentLocation;

          context.read<CurrentWeatherBloc>().add(
                FetchCurrentWeather(
                  latitude: currentLocation?.latitude ?? 0,
                  longitude: currentLocation?.longitude ?? 0,
                ),
              );
      }
    },
  );
}
