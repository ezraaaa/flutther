import 'package:breakpoint/breakpoint.dart';
import 'package:common_widgets_flutter/common_widgets_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutther/weather/weather.dart';
import 'package:weather_repository/weather_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CurrentWeatherBloc(
        weatherRepository: context.read<WeatherRepository>(),
      )..add(
          const FetchCurrentWeather(
            latitude: 3.116919308988307,
            longitude: 101.67409235632691,
          ),
        ),
      child: const ResponsiveHomeView(),
    );
  }
}

class ResponsiveHomeView extends StatelessWidget {
  const ResponsiveHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BreakpointBuilder(
      builder: (context, breakpoint) {
        switch (breakpoint.device) {
          case LayoutClass.smallHandset:
          case LayoutClass.mediumHandset:
          case LayoutClass.largeHandset:
            return _MobileView(breakpoint: breakpoint);
          case LayoutClass.smallTablet:
          case LayoutClass.largeTablet:
          case LayoutClass.desktop:
            return _MobileView(breakpoint: breakpoint);
        }
      },
    );
  }
}

class _MobileView extends StatelessWidget {
  const _MobileView({required this.breakpoint});

  final Breakpoint breakpoint;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('My location'),
                Text(
                  'Kuala Lumpur',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
                  builder: (context, state) {
                    switch (state.status) {
                      case CurrentWeatherStatus.inProgress:
                        return Shimmer(
                          child: WeatherOverviewCard(
                            spacing: breakpoint.gutters,
                          ),
                        );

                      case CurrentWeatherStatus.initial:
                      case CurrentWeatherStatus.success:
                      case CurrentWeatherStatus.failure:
                        return Animate(
                          effects: const [FadeEffect()],
                          child: WeatherOverviewCard(
                            spacing: breakpoint.gutters,
                          ),
                        );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
