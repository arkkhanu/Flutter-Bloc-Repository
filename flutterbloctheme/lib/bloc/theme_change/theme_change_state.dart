import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ThemeChangeState extends Equatable {}

class ThemeChangeStateInitial extends ThemeChangeState {
  final ThemeData themeData;
  ThemeChangeStateInitial({required this.themeData});
  @override
  // TODO: implement props
  List<Object?> get props => [themeData];
}

// class ThemeChangeStateLoading extends ThemeChangeState {
//   @override
//   // TODO: implement props
//   List<Object?> get props => [];
// }

class ThemeChangeStateLoaded extends ThemeChangeState {
  final ThemeData themeData;
  ThemeChangeStateLoaded({required this.themeData});
  @override
  // TODO: implement props
  List<Object?> get props => [themeData];
}

// class ThemeChangeStateError extends ThemeChangeState {
//   @override
//   // TODO: implement props
//   List<Object?> get props => [];
// }
