part of 'account_cubit.dart';

sealed class AccountState extends Equatable {
  const AccountState();

  @override
  List<Object> get props => [];
}

final class AccountInitial extends AccountState {}

final class ProfileLoading extends AccountState {}

final class ProfileLoaded extends AccountState {
  final UserModel user;
  const ProfileLoaded({required this.user});
}

final class ProfileFailure extends AccountState {
  final String message;
  const ProfileFailure({required this.message});
}