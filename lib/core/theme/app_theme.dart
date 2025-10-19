import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/styles/font_utils.dart';
import 'package:stat_doctor/core/theme/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData appLightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.scaffoldColorLight,
    primaryColor: AppColors.primaryLight,
    canvasColor: AppColors.cardColorLight,
    cardColor: AppColors.cardColorLight,
    disabledColor: AppColors.primaryLight.withValues(alpha: 0.2),
    hintColor: AppColors.hintColorLight,
    dividerTheme: DividerThemeData(
      color: AppColors.borderColorLight,
      space: 20.h,
      thickness: 1.25.r,
    ),
    unselectedWidgetColor: AppColors.primaryLight.withValues(alpha: 0.2),
    dividerColor: AppColors.borderColorLight,
    fontFamily: AppFont.fontFamily,
    pageTransitionsTheme: AppThemeData.pageTransitionsTheme,
    appBarTheme: AppThemeData.appBarTheme(
      texColor: AppColors.textColorLight,
      backgroundColor: AppColors.scaffoldColorLight,
    ),
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: AppColors.primaryLight,
      secondary: AppColors.secondaryLight,
      surface: AppColors.textColorLight,
      shadow: AppColors.borderColorLight,
      outline: AppColors.borderColorLight,
      onError: AppColors.red,
      onPrimary: AppColors.cardColorLight,
    ),
    inputDecorationTheme: AppThemeData.inputDecorationTheme(
      fillColor: AppColors.cardColorLight,
      borderColor: AppColors.borderColorLight,
      hintColor: AppColors.hintColorLight,
      primaryColor: AppColors.primaryLight,
      textColor: AppColors.textColorLight,
    ),
    elevatedButtonTheme: AppThemeData.elevatedButtonThemeData(
      primaryColor: AppColors.primaryLight,
    ),
    checkboxTheme: AppThemeData.checkboxThemeData(
      primaryColor: AppColors.primaryLight,
    ),
    iconTheme: IconThemeData(color: AppColors.hintColorLight, size: 25.r),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primaryLight,
      selectionHandleColor: AppColors.primaryLight,
    ),

    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.cardColorLight,
      surfaceTintColor: AppColors.textColorLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.cardColorLight,
      selectedItemColor: AppColors.primaryLight,
      unselectedItemColor: AppColors.hintColorLight,
    ),
    tabBarTheme: AppThemeData.tabBarThemeData(
      primaryColor: AppColors.primaryLight,
      borderColor: AppColors.borderColorLight,
    ),
    textTheme: AppThemeData.textTheme(textColor: AppColors.textColorLight),
    cardTheme: CardThemeData(
      elevation: 0.25,
      color: AppColors.cardColorLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryLight,
      foregroundColor: AppColors.textColorDark,
    ),
    listTileTheme: ListTileThemeData(
      horizontalTitleGap: 2,
      minLeadingWidth: 0,
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      dense: true,
    ),
  );

  static ThemeData appDarkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.scaffoldColorDark,
    primaryColor: AppColors.primaryDark,
    canvasColor: AppColors.cardColorDark,
    cardColor: AppColors.cardColorDark,
    disabledColor: AppColors.primaryDark.withValues(alpha: 0.2),
    hintColor: AppColors.hintColorDark,
    dividerTheme: DividerThemeData(
      color: AppColors.borderColorDark,
      space: 20.h,
      thickness: 1.25.r,
    ),
    unselectedWidgetColor: AppColors.primaryDark.withValues(alpha: 0.2),
    dividerColor: AppColors.borderColorDark,
    fontFamily: AppFont.fontFamily,
    pageTransitionsTheme: AppThemeData.pageTransitionsTheme,
    appBarTheme: AppThemeData.appBarTheme(
      texColor: AppColors.textColorDark,
      backgroundColor: AppColors.scaffoldColorDark,
    ),
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      primary: AppColors.primaryDark,
      secondary: AppColors.cardColorDark,
      surface: AppColors.textColorDark,
      shadow: AppColors.borderColorDark,
      outline: AppColors.borderColorDark,
      onError: AppColors.red,
      onPrimary: AppColors.cardColorDark,
    ),
    inputDecorationTheme: AppThemeData.inputDecorationTheme(
      fillColor: AppColors.scaffoldColorDark,
      borderColor: AppColors.borderColorDark,
      hintColor: AppColors.hintColorDark,
      primaryColor: AppColors.primaryDark,
      textColor: AppColors.textColorDark,
    ),
    elevatedButtonTheme: AppThemeData.elevatedButtonThemeData(
      primaryColor: AppColors.primaryDark,
    ),
    checkboxTheme: AppThemeData.checkboxThemeData(
      primaryColor: AppColors.primaryDark,
    ),
    iconTheme: IconThemeData(color: AppColors.hintColorDark, size: 25.r),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primaryDark,
      selectionHandleColor: AppColors.primaryDark,
    ),

    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.cardColorDark,
      surfaceTintColor: AppColors.textColorDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.cardColorDark,
      selectedItemColor: AppColors.primaryDark,
      unselectedItemColor: AppColors.hintColorDark,
    ),
    tabBarTheme: AppThemeData.tabBarThemeData(
      primaryColor: AppColors.primaryDark,
      borderColor: AppColors.borderColorDark,
    ),
    textTheme: AppThemeData.textTheme(textColor: AppColors.textColorDark),
    cardTheme: CardThemeData(
      elevation: 0,
      color: AppColors.cardColorDark,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryDark,
      foregroundColor: AppColors.textColorDark,
    ),
    listTileTheme: ListTileThemeData(
      horizontalTitleGap: 2,
      minLeadingWidth: 0,
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      dense: true,
    ),
  );
}
