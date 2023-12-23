import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:waspha/theme/index.dart'; // Import this for SystemUiOverlayStyle

ThemeData lightThemeData() {


  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    // Setting the Brightness to light so that this can be used as Light ThemeData
    textTheme: CustomTextTheme.textTheme(),
    // Setting the Text Theme to LightTextTheme
    appBarTheme: const AppBarTheme(
      // Customize your AppBarTheme if needed
    ),
  );
}
