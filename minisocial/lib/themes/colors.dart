import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF8839EF);
  static const background = Color(0xFFF5F5F5);
  static const secondary = Color(0xFFFE640B);
  static const text = Color(0xFF4C4F69);
  static const error = Color(0xFFE64553);

  /// ColorSchemeを生成
  static ColorScheme toColorScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: primary,
      onPrimary: background,
      secondary: secondary,
      onSecondary: background,
      error: error,
      onError: background,
      surface: background,
      onSurface: text,
    );
  }
}
