import 'dart:async';

import 'package:api_request_helper_flutter/api_request_helper_flutter.dart';
import 'package:exceptions_flutter/exceptions_flutter.dart';
import 'package:uri/uri.dart';
import 'package:weather_provider/weather_provider.dart';

/// {@template fetch_current_weather_exception}
/// Thrown during the fetching current weather process if a failure occurs
/// {@endtemplate}
class FetchCurrentWeatherException extends ExceptionsFlutter
    implements Exception {
  /// {@macro fetch_current_weather_exception}
  const FetchCurrentWeatherException({
    required String super.code,
    super.message,
  });
}

/// {@template weather_provider}
/// Data Provider which manages weather raw data
/// {@endtemplate}
class WeatherProvider {
  /// {@macro weather_provider}
  WeatherProvider({
    ApiRequestHelperFlutter? apiRequestHelper,
  }) : _apiRequestHelper = apiRequestHelper ?? ApiRequestHelperFlutter();

  final ApiRequestHelperFlutter _apiRequestHelper;

  /// Open Weather Map API URL
  static const openWeatherApiUrl =
      String.fromEnvironment('OPENWEATHER_API_URL');

  /// Open Weather Map API Key
  static const apiKey = String.fromEnvironment('WEATHER_API_KEY');

  /// Fetches the current weather data based on the provided latitude and
  /// longitude coordinates.
  Future<LocationWeather> fetchCurrentWeather({
    required num latitude,
    required num longitude,
  }) async {
    final template = UriTemplate(
      '$openWeatherApiUrl/weather{?lat,lon,appid,units}',
    );

    final apiUri = Uri.parse(
      template.expand({
        'lat': latitude,
        'lon': longitude,
        'appid': apiKey,
        'units': 'metric',
      }),
    );

    try {
      final weatherResponse =
          await _apiRequestHelper.get(uri: apiUri) as Map<String, dynamic>?;

      if (weatherResponse != null) {
        return LocationWeather.fromJson(weatherResponse);
      } else {
        return LocationWeather.empty;
      }
    } on ExceptionsFlutter catch (error) {
      throw FetchCurrentWeatherException(
        code: error.code.toString(),
        message: error.message,
      );
    } on TimeoutException catch (error) {
      throw FetchCurrentWeatherException(
        code: 'timeout',
        message: error.message,
      );
    }
  }
}
