import 'package:flutter/material.dart';

final ThemeData defaultTheme = _buildDefaultTheme();

ThemeData _buildDefaultTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    textTheme: _buildDefaultTextTheme(base.textTheme),
    primaryTextTheme: _buildDefaultTextTheme(base.primaryTextTheme),
    //accentTextTheme: _buildDefaultTextTheme(base.accentTextTheme),
  );
}

TextTheme _buildDefaultTextTheme(TextTheme base) {    
  return base.copyWith(
    // Adding a ? before each .copyWith( call ensures that if the property is null, it simply doesn't try to copy it.
    headlineMedium: base.headlineMedium?.copyWith(
      fontFamily: 'Cardo',
      fontWeight: FontWeight.w500,

    ),
    titleLarge: base.titleLarge?.copyWith(
      color: Colors.black,
      fontWeight: FontWeight.w700,
      fontSize: 30.0,
    ),
    bodySmall: base.bodySmall?.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
    bodyMedium: base.bodyMedium?.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
    ),
  );
}