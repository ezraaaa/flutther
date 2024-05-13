import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutther/weather/weather.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:weather_provider/weather_provider.dart';

class WeatherOverviewCard extends StatelessWidget {
  const WeatherOverviewCard({super.key, this.spacing = 16});

  final double spacing;

  @override
  Widget build(BuildContext context) {
    final locale = View.of(context).platformDispatcher.locale;
    final numberFormat = NumberFormat('', locale.toString());

    return BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
      builder: (context, state) {
        final currentWeather = state.currentWeather;
        final temperature = currentWeather.mainDetails?.temperature ?? 0;
        final minTemperature =
            currentWeather.mainDetails?.minimumTemperature ?? 0;
        final maxTemeperature =
            currentWeather.mainDetails?.maximumTemperature ?? 0;

        return Card(
          margin: EdgeInsets.all(spacing),
          elevation: 0,
          color: Theme.of(context).colorScheme.surfaceVariant,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: spacing * 2,
              horizontal: spacing,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: numberFormat.format(temperature),
                      ),
                      const TextSpan(text: '°C'),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                SizedBox(height: spacing),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const WeatherIcon(),
                    SizedBox(width: spacing),
                    DefaultTextStyle(
                      style: Theme.of(context).textTheme.titleMedium!,
                      child: const WeatherLabel(),
                    ),
                  ],
                ),
                SizedBox(height: spacing / 2),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(text: 'H: '),
                      TextSpan(text: numberFormat.format(maxTemeperature)),
                      const TextSpan(text: '°C'),
                      const TextSpan(text: '  |  '),
                      const TextSpan(text: 'L: '),
                      TextSpan(text: numberFormat.format(minTemperature)),
                      const TextSpan(text: '°C'),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
      builder: (context, state) {
        final currentWeather = state.currentWeather;
        final weather = currentWeather.weather?.first;

        switch (weather?.type) {
          case null:
          case WeatherType.unknown:
            return const Icon(Icons.question_mark_outlined);
          case WeatherType.clear:
            return const Icon(Icons.wb_sunny_outlined);
          case WeatherType.clouds:
            return const Icon(Icons.wb_cloudy_outlined);
          case WeatherType.rain:
            return Icon(MdiIcons.weatherRainy);
          case WeatherType.thunderstorm:
            return const Icon(Icons.thunderstorm_outlined);
          case WeatherType.snow:
            return const Icon(Icons.cloudy_snowing);
          case WeatherType.drizzle:
            return Icon(MdiIcons.weatherPouring);
          case WeatherType.smoke:
            return Icon(MdiIcons.smoke);
          case WeatherType.haze:
          case WeatherType.ash:
            return Icon(MdiIcons.weatherHazy);
          case WeatherType.dust:
          case WeatherType.sand:
            return Icon(MdiIcons.weatherDust);
          case WeatherType.mist:
          case WeatherType.fog:
            return Icon(MdiIcons.weatherFog);
          case WeatherType.squall:
            return Icon(MdiIcons.weatherWindy);
          case WeatherType.tornado:
            return Icon(MdiIcons.weatherTornado);
        }
      },
    );
  }
}

class WeatherLabel extends StatelessWidget {
  const WeatherLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
      builder: (context, state) {
        final currentWeather = state.currentWeather;
        final weather = currentWeather.weather?.first;

        switch (weather?.type) {
          case null:
          case WeatherType.unknown:
            return const Text('Unknown');
          case WeatherType.clear:
            return const Text('Clear');
          case WeatherType.clouds:
            return const Text('Cloudy');
          case WeatherType.rain:
            return const Text('Rainy');
          case WeatherType.thunderstorm:
            return const Text('Thunderstorm');
          case WeatherType.snow:
            return const Text('Snowing');
          case WeatherType.drizzle:
            return const Text('Drizzling');
          case WeatherType.smoke:
            return const Text('Smoke');
          case WeatherType.haze:
          case WeatherType.ash:
            return const Text('Hazy');
          case WeatherType.dust:
          case WeatherType.sand:
            return const Text('Dusty');
          case WeatherType.mist:
            return const Text('Misty');
          case WeatherType.fog:
            return const Text('Foggy');
          case WeatherType.squall:
            return const Text('Windy');
          case WeatherType.tornado:
            return const Text('Tornado');
        }
      },
    );
  }
}
