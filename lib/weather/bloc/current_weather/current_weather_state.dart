part of 'current_weather_bloc.dart';

enum CurrentWeatherStatus { initial, inProgress, success, failure }

class CurrentWeatherState extends Equatable {
  const CurrentWeatherState({
    this.currentWeather = LocationWeather.empty,
    this.errorCode = '',
    this.status = CurrentWeatherStatus.initial,
  });

  final LocationWeather currentWeather;
  final String errorCode;
  final CurrentWeatherStatus status;

  @override
  List<Object> get props => [currentWeather, errorCode, status];

  CurrentWeatherState copyWith({
    LocationWeather? currentWeather,
    String? errorCode,
    CurrentWeatherStatus? status,
  }) {
    return CurrentWeatherState(
      currentWeather: currentWeather ?? this.currentWeather,
      errorCode: errorCode ?? this.errorCode,
      status: status ?? this.status,
    );
  }
}
