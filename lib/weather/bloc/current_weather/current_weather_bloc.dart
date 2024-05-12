import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_provider/weather_provider.dart';
import 'package:weather_repository/weather_repository.dart';

part 'current_weather_event.dart';
part 'current_weather_state.dart';

class CurrentWeatherBloc
    extends Bloc<CurrentWeatherEvent, CurrentWeatherState> {
  CurrentWeatherBloc({WeatherRepository? weatherRepository})
      : _weatherRepository = weatherRepository ?? WeatherRepository(),
        super(const CurrentWeatherState()) {
    on<FetchCurrentWeather>(_onFetchCurrentWeather);
    on<CurrentWeatherUpdated>(_onCurrentWeatherUpdated);
  }

  final WeatherRepository _weatherRepository;

  Future<void> _onFetchCurrentWeather(
    FetchCurrentWeather event,
    Emitter<CurrentWeatherState> emit,
  ) async {
    emit(state.copyWith(status: CurrentWeatherStatus.inProgress));

    final latitude = event.latitude;
    final longitude = event.longitude;

    try {
      final currentWeather = await _weatherRepository.fetchCurrentWeather(
        latitude: latitude,
        longitude: longitude,
      );

      add(CurrentWeatherUpdated(currentWeather));
    } on FetchCurrentWeatherException catch (error) {
      emit(
        state.copyWith(
          errorCode: error.code,
          status: CurrentWeatherStatus.failure,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          errorCode: error.toString(),
          status: CurrentWeatherStatus.failure,
        ),
      );
    }
  }

  void _onCurrentWeatherUpdated(
    CurrentWeatherUpdated event,
    Emitter<CurrentWeatherState> emit,
  ) {
    emit(
      state.copyWith(
        currentWeather: event.currentWeather,
        status: CurrentWeatherStatus.success,
      ),
    );
  }
}
