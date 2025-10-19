import 'package:stat_doctor/core/config/app_end_points.dart';
import 'package:stat_doctor/core/network/network_service/api_basehelper.dart';
import 'package:stat_doctor/core/storage/data/storage.dart';
import 'package:stat_doctor/features/auth/data/objects_value/login_params.dart';
import 'package:stat_doctor/features/auth/data/objects_value/register_params.dart';
import 'package:stat_doctor/features/auth/data/objects_value/send_sms_params.dart';

abstract class AuthDatasource {
  Future<String> sendSmsLogin({required SendSmsParams params});
  Future<String> login({required LoginParams params});
  Future<String> register({required RegisterParams params});
}

class AuthDatasourceImpl implements AuthDatasource{
  final ApiBaseHelper apiBaseHelper;
  final Storage storage;
  AuthDatasourceImpl({required this.storage, required this.apiBaseHelper});

  @override
  Future<String> login({required LoginParams params}) async{
    final response = await apiBaseHelper.post(url: AppEndpoints.login, body: params.toJson());
    String result = response['message'];
    return result;
  }
  
  @override
  Future<String> register({required RegisterParams params}) async{
    final response = await apiBaseHelper.post(url: AppEndpoints.register, body: params.toJson());
    String result = response['message'];
    return result;
  }
  
  @override
  Future<String> sendSmsLogin({required SendSmsParams params}) async{
    final response = await apiBaseHelper.get(url: AppEndpoints.sendSmsLogin(countryCode: params.countryCode, phone: params.phone), body: params.toJson());
    String result = response['message'];
    return result;
  }
}