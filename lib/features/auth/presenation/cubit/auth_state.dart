part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

//! ================== Initial State ==================

final class AuthInitial extends AuthState {}


//! ================== Login State ==================

final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {
  final UserModel user;
  const LoginSuccess({required this.user});
}

final class LoginFailure extends AuthState {
  final String message;
  const LoginFailure({required this.message});
}

//! ================== Send Sms State ==================

final class SendSmsLoading extends AuthState {}

final class SendSmsSuccess extends AuthState {
  final String message;
  const SendSmsSuccess({required this.message});
}

final class SendSmsFailure extends AuthState {
  final String message;
  const SendSmsFailure({required this.message});
}


//! ================== Register State ==================

final class RegisterLoading extends AuthState {}

final class RegisterSuccess extends AuthState {
  final String message;
  const RegisterSuccess({required this.message});
}

final class RegisterFailure extends AuthState {
  final String message;
  const RegisterFailure({required this.message});
}