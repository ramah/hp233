import 'dart:math';

import 'package:flutter/material.dart';

const Color mainColor = Color(0Xffe06f1f);
const Color anotherColor = Color(0Xff166d9d);
int tintValue(int value, double factor) =>
    max(0, min((value + ((255 - value) * factor)).round(), 255));

Color tintColor(Color color, double factor) => Color.fromRGBO(
      tintValue(color.red, factor),
      tintValue(color.green, factor),
      tintValue(color.blue, factor),
      1,
    );
MaterialColor generateMaterialColor(Color color) {
  return MaterialColor(color.value, {
    50: tintColor(color, 0.5),
    100: tintColor(color, 0.4),
    200: tintColor(color, 0.3),
    300: tintColor(color, 0.2),
    400: tintColor(color, 0.1),
    500: tintColor(color, 0),
    600: tintColor(color, -0.1),
    700: tintColor(color, -0.2),
    800: tintColor(color, -0.3),
    900: tintColor(color, -0.4),
  });
}

ThemeData buildThemeData() {
  return ThemeData(
    backgroundColor: mainColor,
    canvasColor: Colors.transparent,
    primaryColor: mainColor,
    indicatorColor: mainColor,
    splashColor: mainColor,
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(foregroundColor: mainColor),
    inputDecorationTheme: const InputDecorationTheme(
      prefixStyle: TextStyle(color: mainColor),
      labelStyle: TextStyle(fontSize: 20.0),
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: mainColor,
          style: BorderStyle.solid,
        ),
      ),
    ),
    iconTheme: const IconThemeData(color: mainColor),
    colorScheme:
        ColorScheme.fromSwatch(primarySwatch: generateMaterialColor(mainColor))
            .copyWith(
      secondary: anotherColor,
    ),
  );
}
