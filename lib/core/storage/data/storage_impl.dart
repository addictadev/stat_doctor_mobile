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

  StorageImpl({
    required this.stringBox,
    required this.boolBox,
    required this.userBox,
  });


  //* user storage
  @override
  Future<void> storeUserData({required UserModel user}) async {await userBox.put(_user, user);}

  @override
  UserModel? getUserData() => userBox.get(_user);

  @override
  Future<void> deleteUserData() async {await userBox.delete(_user);}




  //* token storage
  @override
  Future<void> storeToken({required String token}) async {await stringBox.put(_token, token);}

  @override
  String? getToken()  => stringBox.get(_token);

  @override
  Future<void> deleteToken() async {await stringBox.delete(_token);}


  //* authentication


  //* language storage
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


  //* check language
  @override
  bool isSelectLang() => stringBox.get(_language) != null;


  //* onboarding storage
  @override
  Future<void> storeOnboarding({required bool isCompleted}) async {await boolBox.put(_onboarding, isCompleted);}

  @override
  bool getOnboarding() => boolBox.get(_onboarding) ?? false;

  @override
  Future<void> deleteOnboarding() async {await boolBox.delete(_onboarding);}
}