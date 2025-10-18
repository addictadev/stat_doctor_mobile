import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

extension ThemeModeX on BuildContext {
  bool get isDarkMode => AdaptiveTheme.of(this).brightness == Brightness.dark;
} 