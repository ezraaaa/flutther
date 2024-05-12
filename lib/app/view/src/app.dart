import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutther/app/app.dart';
import 'package:flutther/home/home.dart';
import 'package:flutther/l10n/l10n.dart';
import 'package:weather_repository/weather_repository.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherRepository(),
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieves the default theme for the platform
    //TextTheme textTheme = Theme.of(context).textTheme;

    // Use with Google Fonts package to use downloadable fonts
    final textTheme = createTextTheme(
      context: context,
      bodyFontString: 'Inter',
      displayFontString: 'Noto Serif',
    );

    final theme = MaterialTheme(textTheme);

    return MaterialApp(
      theme: theme.light(),
      darkTheme: theme.dark(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomePage(),
    );
  }
}
