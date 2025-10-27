import 'package:stat_doctor/features/account/data/models/user_model.dart';
import 'package:stat_doctor/features/auth/data/objects_value/login_params.dart';
import 'package:stat_doctor/features/auth/data/objects_value/register_params.dart';
import 'package:stat_doctor/features/auth/data/objects_value/send_sms_params.dart';
import 'package:stat_doctor/features/auth/data/repository/auth_repository._impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  
  AuthCubit({required this.authRepository,}) : super(AuthInitial());

  Future<void> sendSmsLogin({required SendSmsParams params}) async{
    emit(SendSmsLoading());
    final result = await authRepository.sendSmsLogin(params: params);
    if (!isClosed) {
      result.fold(
        (failure) => emit(SendSmsFailure(message: failure.message)),
        (success) => emit(SendSmsSuccess(message: success)),
      );  
    }
  }

  Future<void> login({required LoginParams params}) async{
    emit(LoginLoading());
    final result = await authRepository.login(params: params);
    if (!isClosed) {
      result.fold(
        (failure) => emit(LoginFailure(message: failure.message)),
        (success) => emit(LoginSuccess(user: success)),
      );  
    }
  }

  Future<void> register({required RegisterParams params}) async{
    emit(RegisterLoading());
    final result = await authRepository.register(params: params);
    if (!isClosed) {
      result.fold(
        (failure) => emit(RegisterFailure(message: failure.message)),
        (success) => emit(RegisterSuccess(user: success)),
      );  
    }
  }

  Future<void> biometricLogin() async{
    emit(BiometricLoginLoading());
    final result = await authRepository.biometricLogin();
    if (!isClosed) {
      result.fold(
        (failure) => emit(BiometricLoginFailure(message: failure.message)),
        (success) => emit(BiometricLoginSuccess(message: success)),
      );  
    }
  }
}
