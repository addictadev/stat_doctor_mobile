import 'dart:ui';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:stat_doctor/core/injection/injection_container.dart';
import 'package:stat_doctor/core/navigation/app_navigator.dart';
import 'package:flutter/material.dart';

class AppThemeMode {
  static bool get isDarkMode {
    try {
      final navigator = sl<AppNavigator>();
      final currentState = navigator.navigatorKey.currentState;
      if (currentState == null || !currentState.mounted) {return false;}
      final context = currentState.context;
      return AdaptiveTheme.of(context).brightness == Brightness.dark;
    } catch (e) {
      return false;
    }
  }
}