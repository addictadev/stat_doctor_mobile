part of 'location_cubit.dart';

sealed class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

final class LocationInitial extends LocationState {}

final class GetCurrentLocationLoading extends LocationState {}

final class GetCurrentLocationLoaded extends LocationState {
  final Position position;
  const GetCurrentLocationLoaded({required this.position});
  @override
  List<Object> get props => [position];
}

final class GetCurrentLocationError extends LocationState {
  final String message;
  const GetCurrentLocationError({required this.message});
  @override
  List<Object> get props => [message];
}

class LocationPermissionDenied extends LocationState {}

class LocationServiceDisabled extends LocationState {}