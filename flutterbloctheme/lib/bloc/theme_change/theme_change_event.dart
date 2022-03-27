import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ThemeChangeEvent extends Equatable {}

class ThemeChangeEventLoadTheme extends ThemeChangeEvent {
  // final ThemeData themeData;
  // ThemeChangeEventLoadTheme({required this.themeData});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class ThemeChangeEventChange extends ThemeChangeEvent {
  // final ThemeData themeData;
  // ThemeChangeEventChange({required this.themeData});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
// class ThemeChangeEventLight extends ThemeChangeEvent{
//   @override
//   // TODO: implement props
//   List<Object?> get props => [];
// }
// class ThemeChangeEventDark extends ThemeChangeEvent{
//   @override
//   // TODO: implement props
//   List<Object?> get props => [];
// }
