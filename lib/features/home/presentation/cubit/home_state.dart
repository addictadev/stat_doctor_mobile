part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class GetHomeShiftsLoading extends HomeState {}

final class GetMoreWorkedHomeShiftsLoading extends HomeState {}
final class GetMoreInterestedHomeShiftsLoading extends HomeState {}
final class GetMoreNearHomeShiftsLoading extends HomeState {}

final class GetHomeShiftsLoaded extends HomeState {
  final HomeShiftsDataModel homeShiftsDataModel;
  const GetHomeShiftsLoaded({required this.homeShiftsDataModel});
  @override
  List<Object> get props => [homeShiftsDataModel];
}

final class GetHomeShiftsFailure extends HomeState {
  final String message;
  const GetHomeShiftsFailure({required this.message});
  @override
  List<Object> get props => [message];
}


final class FavoriteLoading extends HomeState {}

final class AddToFavoriteSuccess extends HomeState {
  final String message;
  const AddToFavoriteSuccess({required this.message});
  @override
  List<Object> get props => [message];
}

final class RemoveFromFavoriteSuccess extends HomeState {
  final String message;
  const RemoveFromFavoriteSuccess({required this.message});
  @override
  List<Object> get props => [message];
}

final class FavoriteFailure extends HomeState {
  final String message;
  const FavoriteFailure({required this.message});
  @override
  List<Object> get props => [message];
}