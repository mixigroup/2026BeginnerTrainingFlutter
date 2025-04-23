import 'package:flutter/material.dart';

class AppTextStyles {
  static const title = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  static const body = TextStyle(fontSize: 16);

  /// TextTheme を生成
  static TextTheme toTextTheme() {
    return const TextTheme(bodyMedium: body, titleLarge: title);
  }
}
