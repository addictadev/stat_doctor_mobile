abstract class Storage {
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
}
