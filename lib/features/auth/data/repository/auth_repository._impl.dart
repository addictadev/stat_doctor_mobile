import 'package:dartz/dartz.dart';
import 'package:stat_doctor/core/network/network_service/failures.dart';
import 'package:stat_doctor/core/network/network_service/repository_helper.dart';
import 'package:stat_doctor/features/account/data/models/user_model.dart';
import 'package:stat_doctor/features/auth/data/datasource/auth_datasource.dart';
import 'package:stat_doctor/features/auth/data/objects_value/login_params.dart';
import 'package:stat_doctor/features/auth/data/objects_value/register_params.dart';
import 'package:stat_doctor/features/auth/data/objects_value/send_sms_params.dart';


class AuthRepository with RepositoryHelper{
  final AuthDatasource authDatasource;
  AuthRepository({required this.authDatasource,});

  Future<Either<Failure, String>> sendSmsLogin({required SendSmsParams params}) async{
    return handleEither(() => authDatasource.sendSmsLogin(params: params));
  }

  Future<Either<Failure, UserModel>> login({required LoginParams params}) async{
    return handleEither(() => authDatasource.login(params: params));
  }

  Future<Either<Failure, String>> register({required RegisterParams params}) async{
    return handleEither(() => authDatasource.register(params: params));
  }
}