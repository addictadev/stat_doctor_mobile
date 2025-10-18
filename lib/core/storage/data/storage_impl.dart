import 'package:stat_doctor/core/storage/data/storage.dart';
import 'package:hive/hive.dart';

class StorageImpl implements Storage {
  final Box<String> stringBox;
  final Box<bool> boolBox;

  static final String _token = "token";
  static final String _language = "language";

  StorageImpl({
    required this.stringBox,
    required this.boolBox,
  });


  //* user storage



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
}