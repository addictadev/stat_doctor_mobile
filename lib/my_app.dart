import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:stat_doctor/features/splash/presentation/view/splash_screen.dart' show SplashScreen;
import 'package:stat_doctor/multi_providers.dart';

import 'core/navigation_services/navigation_manager.dart';
import 'core/theme/app_theme.dart';

class MyApp extends StatefulWidget {
  factory MyApp() => _instance;
  const MyApp._internal();

  static const MyApp _instance = MyApp._internal();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return LocalizedApp(
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return
          MultiProvider(
          providers: MultiProviders.providers(),
          child: 
          
           MaterialApp(
            theme: AppTheme.createTheme(LocalizeAndTranslate.getLanguageCode()),
            builder: EasyLoading.init(),
            title: "Stat Doctor",

            navigatorKey: NavigationManager.navigatorKey,
            localizationsDelegates: LocalizeAndTranslate.delegates,
            locale: Locale(LocalizeAndTranslate.getLanguageCode()),
            supportedLocales: const [Locale('en'), Locale('ar')],
            onGenerateRoute: (settings) {
              return PageRouteBuilder(
                settings: settings,
                pageBuilder: (context, animation, secondaryAnimation) {
                  return FadeTransition(
                    opacity: animation,
                    child: const SplashScreen(),
                  );
                },
              );
            },
            debugShowCheckedModeBanner: false,
          ));
        },
      ),
    );
  }
}
