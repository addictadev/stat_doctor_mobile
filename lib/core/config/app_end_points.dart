import 'package:stat_doctor/features/options/data/enums/option_type.dart';

class AppEndpoints {
  static String baseUrl = "https://api-dev.statdoctor.app/app/api/app";

  static String login = "/public/user-login";
  static String register = "/profile-info-register";
  static String logout = "/public/user-logout";
  static String uploadMultipleFiles = "/public/pic/upload-file-multiple";
  static String biometricLogin = "/profile-refreshToken";
  static String profile = "/profile-info-all";
  static String homeFilters = "/shifts/home/filter-sys-get";

  static String myShiftList({required String filter, required String mode, required int page}) => "/shifts/orders-list/$filter/$mode/$page/10";
  
  static String homeShifts({required int page, required String status}) => "/shifts/home-shifts-days/all/$page/$status";

  static String getOptions({required OptionType type}) => "/sys/get-type/${type.name}";
  static String sendSmsLogin({required String countryCode, required String phone}) => "/public/get-sms-code/$countryCode/$phone";
  static String sendSmsChange({required String countryCode, required String phone}) => "/profile-info-edit-get-sms-code/$countryCode/$phone";

  static String addToFavorite({required String hospitalAccountId}) => "/hospitals-favourites-add/$hospitalAccountId";
  static String removeFromFavorite({required String hospitalAccountId}) => "/hospitals-favourites-removed/$hospitalAccountId";

  static String shiftApply({required String shiftId}) => "/shifts/shifts-apply/$shiftId";
  static String shiftCancel({required String orderId, required String shiftId, required String shiftDayId}) => "/shifts/shifts-cancel/$orderId/$shiftId/$shiftDayId";

  static String getNotificatios({required String page}) => "/notification/notification-list/$page/10";
  static String deleteNotification({required String notificationId}) => "/notification/notification/notification-deleteShiftsDaysAll/$notificationId";
  static String deleteAllNotifications() => "/notification/notification/notification-deleteShiftsDaysAll-all";

  static String settings = "/app-setting-get";
  static String editSettings({required String key, required int value}) => "/app-setting-edit/$key/$value";
}
