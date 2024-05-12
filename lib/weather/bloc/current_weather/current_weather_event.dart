part of 'current_weather_bloc.dart';

sealed class CurrentWeatherEvent extends Equatable {
  const CurrentWeatherEvent();
}

class FetchCurrentWeather extends CurrentWeatherEvent {
  const FetchCurrentWeather({required this.latitude, required this.longitude});

  final num latitude;
  final num longitude;

  @override
  List<Object> get props => [latitude, longitude];
}

class CurrentWeatherUpdated extends CurrentWeatherEvent {
  const CurrentWeatherUpdated(this.currentWeather);

  final LocationWeather currentWeather;

  @override
  List<Object> get props => [currentWeather];
}
