import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloctheme/bloc/theme_change/theme_change_event.dart';
import 'package:flutterbloctheme/bloc/theme_change/theme_change_state.dart';
import 'package:flutterbloctheme/services/share_pref.dart';

class ThemeChangeBloc extends Bloc<ThemeChangeEvent, ThemeChangeState> {
  ThemeChangeBloc()
      : super(ThemeChangeStateInitial(
            themeData: ThemeData(brightness: Brightness.light))) {
    on<ThemeChangeEventLoadTheme>((event, emit) {
      bool isLight =
          SharedPref.instance?.sharedPreferences?.getBool("isThemeLight") ??
              true;
      if (isLight) {
        emit(ThemeChangeStateLoaded(
            themeData: ThemeData(brightness: Brightness.light)));
      } else {
        emit(ThemeChangeStateLoaded(
            themeData: ThemeData(brightness: Brightness.dark)));
      }
    });
    on<ThemeChangeEventChange>((event, emit) async {
      bool isLight =
          SharedPref.instance?.sharedPreferences?.getBool("isThemeLight") ??
              true;
      if (isLight) {
        await SharedPref.instance?.sharedPreferences
            ?.setBool("isThemeLight", false);
        emit(ThemeChangeStateLoaded(
            themeData: ThemeData(brightness: Brightness.dark)));
      } else {
        await SharedPref.instance?.sharedPreferences
            ?.setBool("isThemeLight", true);
        emit(ThemeChangeStateLoaded(
            themeData: ThemeData(brightness: Brightness.light)));
      }
    });
  }
}
