// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_provider/weather_provider.dart';

void main() {
  group('WeatherProvider', () {
    test('can be instantiated', () {
      expect(WeatherProvider(), isNotNull);
    });
  });
}
