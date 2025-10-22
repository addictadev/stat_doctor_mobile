import 'package:stat_doctor/features/options/data/enums/option_type.dart';

class AppEndpoints {
  static String baseUrl = "https://api-dev.statdoctor.app/app/api/app";

  static String login = "/public/user-login";
  static String register = "/profile-info-register";
  static String logout = "/public/user-logout";
  static String uploadMultipleFiles = "/public/pic/upload-file-multiple";
  static String getOptions({required OptionType type}) => "/sys/get-type/${type.name}";

  static String sendSmsLogin({required String countryCode, required String phone}) => "/public/get-sms-code/$countryCode/$phone";
  static String sendSmsChange({required String countryCode, required String phone}) => "/profile-info-edit-get-sms-code/$countryCode/$phone";
}
