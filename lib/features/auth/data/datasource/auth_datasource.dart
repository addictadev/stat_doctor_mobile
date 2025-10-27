import 'package:stat_doctor/core/config/app_end_points.dart';
import 'package:stat_doctor/core/network/network_service/api_basehelper.dart';
import 'package:stat_doctor/core/storage/data/storage.dart';
import 'package:stat_doctor/features/auth/data/objects_value/login_params.dart';
import 'package:stat_doctor/features/auth/data/objects_value/register_params.dart';
import 'package:stat_doctor/features/auth/data/objects_value/send_sms_params.dart';
import 'package:stat_doctor/features/account/data/models/user_model.dart';

abstract class AuthDatasource {
  Future<String> sendSmsLogin({required SendSmsParams params});
  Future<UserModel> login({required LoginParams params});
  Future<UserModel> register({required RegisterParams params});
  Future<String> biometricLogin();
}

class AuthDatasourceImpl implements AuthDatasource{
  final ApiBaseHelper apiBaseHelper;
  final Storage storage;
  AuthDatasourceImpl({required this.storage, required this.apiBaseHelper});

  @override
  Future<UserModel> login({required LoginParams params}) async{
    final response = await apiBaseHelper.post(url: AppEndpoints.login, body: params.toJson());
    UserModel user = UserModel.fromJson(response['data']);
    if(!user.registerFlag) {
      await storage.storeUserData(user: user);
      await storage.storeAuthorized(isAuthorized: true);
    }
    return user;
  }
  
  @override
  Future<UserModel> register({required RegisterParams params}) async{
    final response = await apiBaseHelper.post(url: AppEndpoints.register, body: params.toJson());
    UserModel user = UserModel.fromJson(response['data']);
    if(!user.registerFlag) {
      await storage.storeUserData(user: user);
      await storage.storeAuthorized(isAuthorized: true);
    }
    return user;
  }
  
  @override
  Future<String> sendSmsLogin({required SendSmsParams params}) async{
    final response = await apiBaseHelper.get(url: AppEndpoints.sendSmsLogin(countryCode: params.countryCode, phone: params.phone), body: params.toJson());
    String result = response['message'];
    return result;
  }

  @override
  Future<String> biometricLogin() async{
    final response = await apiBaseHelper.get(url: AppEndpoints.biometricLogin);
    String result = response['message'];
    await storage.storeAuthorized(isAuthorized: true);
    return result;
  }
}