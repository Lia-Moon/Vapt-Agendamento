import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // --- Theme blue ---
  static const primaryBlue = Color(0xFF2678B7);
  // static const secondaryBlue = Color(0xFFF0F0F0);

  // --- theme purple ---
  static const primaryPurple = Color(0xFF6200EE);
  static const secondaryPurple = Color(0xFF03DAC6);

  // --- theme pink ---
  static const primaryPink = Color(0xFFE91E63);
  static const secondaryPink = Color(0xFFF48FB1);

  // generate color scheme based on selected color
  static ColorScheme getColorScheme(bool isDarkMode, String themeColor) {

    if (themeColor == 'pink') {
      return ColorScheme.fromSeed(
        seedColor: primaryPink,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        primary: primaryPink, // force the exact color
      );
    }

    if(themeColor == 'purple') {
      return ColorScheme.fromSeed(
        seedColor: primaryPurple,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        primary: primaryPurple, // force the exact color
      );
    }

    // Default (Purple)
    return ColorScheme.fromSeed(
      seedColor: primaryBlue,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
    );
  }
}
