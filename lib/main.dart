import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:chi_scartlethack/bloc/theme_bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_observer.dart';
import 'config/custom_router.dart';
import 'core/utils/app_constants.dart';
import 'screens/splash/splash_screen.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: AdaptiveTheme(
        light: ThemeState.lightTheme.themeData,
        dark: ThemeState.darkTheme.themeData,
        debugShowFloatingThemeButton: false,
        initial: AdaptiveThemeMode.light,
        builder: (light, dark) => BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              title: AppConstants.appTitle,
              theme: state.themeData,
              darkTheme: state.themeData,
              debugShowCheckedModeBanner: false,
              onGenerateRoute: CustomRouter.onGenerateRoute,
              initialRoute: Splash.routeName,
            );
          },
        ),
      ),
    );
  }
}
