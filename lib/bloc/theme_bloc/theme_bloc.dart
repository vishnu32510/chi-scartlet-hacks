import 'package:bloc/bloc.dart';
import 'package:chi_scartlethack/bloc/theme_bloc/theme_event.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.darkTheme) {
    on<ThemeEventChange>((event, emit) {
      switch (event.currentTheme) {
        case ThemeEventType.toggleDark:
          emit(ThemeState.darkTheme);
          break;
        case ThemeEventType.toggleLight:
          emit(ThemeState.lightTheme);
          break;
      }
    });
  }
}
