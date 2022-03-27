import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloctheme/bloc/theme_change/theme_change_event.dart';
import 'package:flutterbloctheme/bloc/theme_change/theme_change_state.dart';

class ThemeChangeBloc extends Bloc<ThemeChangeEvent, ThemeChangeState> {
  ThemeChangeBloc()
      : super(ThemeChangeStateInitial()) {
    on<ThemeChangeEventDark>((event, emit) {
      em
    });

  }
}
