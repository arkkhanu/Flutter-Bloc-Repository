import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ThemeChangeEvent extends Equatable {}

class ThemeChangeEventLight extends ThemeChangeEvent {
  final ThemeData themeData;

  ThemeChangeEventLight({required this.themeData});

  @override
  // TODO: implement props
  List<Object?> get props => [themeData];
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
