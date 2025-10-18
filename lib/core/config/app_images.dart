import 'package:stat_doctor/core/methods/app_theme_mode.dart';

class AppImages {
  static const String _path = 'assets/images/';

  // Image paths
  static final String logo = AppThemeMode.isDarkMode ? logoDark : logoLight;
  static const String icon = "${_path}icon.png";
  static const String logoDark = "${_path}logo_dark.png";
  static const String logoLight = "${_path}logo_light.png";

}