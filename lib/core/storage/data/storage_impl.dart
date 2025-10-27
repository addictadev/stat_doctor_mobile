import 'package:stat_doctor/core/storage/data/storage.dart';
import 'package:hive/hive.dart';
import 'package:stat_doctor/features/account/data/models/user_model.dart';

class StorageImpl implements Storage {
  final Box<String> stringBox;
  final Box<bool> boolBox;
  final Box<UserModel> userBox;

  static final String _token = "token";
  static final String _language = "language";
  static final String _onboarding = "onboarding";
  static final String _user = "user";
  static final String _authorized = "authorized";
  static final String _faceIdEnabled = "faceIdEnabled";
  static final String _touchIdEnabled = "touchIdEnabled";

  StorageImpl({
    required this.stringBox,
    required this.boolBox,
    required this.userBox,
  });


  //! ================================================== user storage ==================================================
  @override
  Future<void> storeUserData({required UserModel user}) async {await userBox.put(_user, user);}

  @override
  UserModel? getUserData() => userBox.get(_user);

  @override
  Future<void> deleteUserData() async {await userBox.delete(_user);}


  //! ================================================== token storage ==================================================
  @override
  Future<void> storeToken({required String token}) async {await stringBox.put(_token, token);}

  @override
  String? getToken()  => stringBox.get(_token);

  @override
  Future<void> deleteToken() async {await stringBox.delete(_token);}



  //! ================================================== language storage ==================================================
  @override
  Future<void> storeLang({required String langCode}) async {
    await stringBox.put(_language, langCode);
  }

  @override
  String getLang() {
    return stringBox.get(_language) ?? "en";
  }

  @override
  Future<void> deleteLang() async {
    await stringBox.delete(_language);
  }


  //! ================================================== authorized storage ==================================================
  @override
  bool isAuthorized() => boolBox.get(_authorized) ?? false;

  @override
  Future<void> storeAuthorized({required bool isAuthorized}) async {await boolBox.put(_authorized, isAuthorized);}

  @override
  Future<void> deleteAuthorized() async {await boolBox.delete(_authorized);}


  //! ================================================== biometric storage ==================================================
  @override
  bool getFaceIdEnabled() => boolBox.get(_faceIdEnabled) ?? false;

  @override
  bool getTouchIdEnabled() => boolBox.get(_touchIdEnabled) ?? false;

  @override
  Future<void> storeFaceIdEnabled({required bool isFaceIdEnabled}) async {await boolBox.put(_faceIdEnabled, isFaceIdEnabled);}

  @override
  Future<void> storeTouchIdEnabled({required bool isTouchIdEnabled}) async {await boolBox.put(_touchIdEnabled, isTouchIdEnabled);}

  @override
  Future<void> deleteFaceIdEnabled() async {await boolBox.delete(_faceIdEnabled);}

  @override
  Future<void> deleteTouchIdEnabled() async {await boolBox.delete(_touchIdEnabled);}


  //! ================================================== onboarding storage ==================================================
  @override
  Future<void> storeOnboarding({required bool isCompleted}) async {await boolBox.put(_onboarding, isCompleted);}

  @override
  bool getOnboarding() => boolBox.get(_onboarding) ?? false;

  @override
  Future<void> deleteOnboarding() async {await boolBox.delete(_onboarding);}

  //! ================================================== clear all storage ==================================================
  @override
  Future<void> logout() async {
    await deleteUserData();
    await deleteAuthorized();
  }
}