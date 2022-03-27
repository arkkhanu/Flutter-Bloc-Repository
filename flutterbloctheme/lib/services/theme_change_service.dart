
import 'dart:async';

import 'package:flutter/material.dart';

class ThemeChangeService{


  // final StreamController<ThemeData> themeControllerStream = StreamController<ThemeData>();
  //
  // ThemeChangeService(){
  //   themeControllerStream.stream.listen((event) {
  //
  //   });
  // }

  // final initialTheme = ThemeData( primarySwatch: Colors.blue,brightness: Brightness.light);

  final String themeKey = "ThemeKey";
  bool? isLightTheme = true;
  ThemeChangeService({this.isLightTheme});
}