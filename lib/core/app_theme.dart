import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData createTheme(bool isDarkMode, String selectedColor) {
    // Uses color scheme created in app_colors
    final colorScheme = AppColors.getColorScheme(isDarkMode, selectedColor);

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      // Function that defines the fonts
      textTheme: _buildTextTheme(isDarkMode ? ThemeData.dark().textTheme : ThemeData.light().textTheme),
    );
  }

  static TextTheme _buildTextTheme(TextTheme base) {    
    return base.copyWith(
      // Adding a ? before each .copyWith( call ensures that if the property is null, it simply doesn't try to copy it
      headlineMedium: base.headlineMedium?.copyWith(
        fontFamily: 'Cardo',
        fontWeight: FontWeight.w500,
      ),
      titleLarge: base.titleLarge?.copyWith(
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
}