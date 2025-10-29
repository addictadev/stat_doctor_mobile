part of 'filter_cubit.dart';

sealed class FilterState extends Equatable {
  const FilterState();

  @override
  List<Object> get props => [];
}

final class FilterInitial extends FilterState {}
final class FilterLoading extends FilterState {}
final class FilterLoaded extends FilterState {
  final HomeFilterModel homeFilterModel;
  const FilterLoaded({required this.homeFilterModel});
  @override
  List<Object> get props => [homeFilterModel];
}
final class FilterFailure extends FilterState {
  final String message;
  const FilterFailure({required this.message});
  @override
  List<Object> get props => [message];
}