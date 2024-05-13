import 'package:breakpoint/breakpoint.dart';
import 'package:common_widgets_flutter/common_widgets_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutther/home/home.dart';
import 'package:flutther/weather/weather.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather_repository/weather_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CurrentWeatherBloc(
            weatherRepository: context.read<WeatherRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => UserLocationBloc(),
        ),
      ],
      child: const ResponsiveHomeView(),
    );
  }
}

class ResponsiveHomeView extends StatefulWidget {
  const ResponsiveHomeView({super.key});

  @override
  State<ResponsiveHomeView> createState() => _ResponsiveHomeViewState();
}

class _ResponsiveHomeViewState extends State<ResponsiveHomeView> {
  @override
  void didChangeDependencies() {
    final locale = View.of(context).platformDispatcher.locale;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await GeocodingPlatform.instance?.setLocaleIdentifier(locale.toString());
      if (!mounted) return;
      context.read<UserLocationBloc>().add(const GetLocationPermission());
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        userLocationBlocListener(),
      ],
      child: BreakpointBuilder(
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
      ),
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
            title: BlocBuilder<UserLocationBloc, UserLocationState>(
              builder: (context, state) {
                final place =
                    state.places.isNotEmpty ? state.places.first : null;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('My location'),
                    Text(
                      place?.locality ?? '',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
                  builder: (context, state) {
                    switch (state.status) {
                      case CurrentWeatherStatus.initial:
                      case CurrentWeatherStatus.inProgress:
                        return Shimmer(
                          child: WeatherOverviewCard(
                            spacing: breakpoint.gutters,
                          ),
                        );

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
