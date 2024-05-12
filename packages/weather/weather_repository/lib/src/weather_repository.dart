import 'package:weather_provider/weather_provider.dart';

/// {@template weather_repository}
/// Repository which manages weather data
/// {@endtemplate}
class WeatherRepository {
  /// {@macro weather_repository}
  WeatherRepository({WeatherProvider? weatherProvider})
      : _weatherProvider = weatherProvider ?? WeatherProvider();

  final WeatherProvider _weatherProvider;

  /// Fetches current weather
  Future<LocationWeather> fetchCurrentWeather({
    required num latitude,
    required num longitude,
  }) async {
    return _weatherProvider.fetchCurrentWeather(
      latitude: latitude,
      longitude: longitude,
    );
  }
}
