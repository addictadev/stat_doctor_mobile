import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:stat_doctor/core/methods/app_state.dart';
import 'package:stat_doctor/core/navigation/app_navigator.dart';
import 'package:stat_doctor/core/network/network_service/api_basehelper.dart';
import 'package:stat_doctor/core/translation/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/storage/data/storage.dart';
import 'package:stat_doctor/core/theme/app_theme.dart';
import 'package:stat_doctor/core/injection/injection_container.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static MyAppState? of(BuildContext context) => context.findAncestorStateOfType<MyAppState>();
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Locale _locale = Locale(sl<Storage>().getLang());

  void setLocale(Locale locale) {
    setState(() {_locale = locale;});
    sl<ApiBaseHelper>().updateLocaleInHeaders(sl<Storage>().getLang());
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) => AdaptiveTheme(
        light: AppTheme.appLightTheme,
        dark: AppTheme.appDarkTheme,
        initial: AdaptiveThemeMode.light,
        debugShowFloatingThemeButton: true,
        builder: (theme, darkTheme) => MaterialApp(
          debugShowCheckedModeBanner: false,
          scrollBehavior: const ScrollBehavior().copyWith(physics: const BouncingScrollPhysics()),
          theme: theme,
          darkTheme: darkTheme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: _locale,
          navigatorKey: sl<AppNavigator>().navigatorKey,
          home: AppState.currentScreen(context),
        )
      )
    );
  }
}