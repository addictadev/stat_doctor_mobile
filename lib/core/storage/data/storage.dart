import 'package:stat_doctor/features/account/data/models/user_model.dart';

abstract class Storage {
  // User Storage
  Future<void> storeUserData({required UserModel user});
  UserModel? getUserData();
  Future<void> deleteUserData();


  // Token Storage
  Future<void> storeToken({required String token});
  String? getToken();
  Future<void> deleteToken();


  // Language Storage
  Future<void> storeLang({required String langCode});
  String getLang();
  Future<void> deleteLang();

  // Check Language
  bool isSelectLang();


  // Onboarding Storage
  Future<void> storeOnboarding({required bool isCompleted});
  bool getOnboarding();
  Future<void> deleteOnboarding();
}
