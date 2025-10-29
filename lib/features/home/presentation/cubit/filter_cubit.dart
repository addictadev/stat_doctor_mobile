import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stat_doctor/features/home/data/models/home_filter_model.dart';
import 'package:stat_doctor/features/home/data/repository/home_repository.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  final HomeRepository homeRepository;
  FilterCubit({required this.homeRepository}) : super(FilterInitial());

  HomeFilterModel homeFilterModel = HomeFilterModel(timeType: [], filterSkills: [], filterSpecialties: [],);

  Future<void> getHomeFilter() async {
    emit(FilterLoading());
    final result = await homeRepository.getHomeFilter();
    if (!isClosed) {
      result.fold(
        (failure) => emit(FilterFailure(message: failure.message)),
        (success) {
          homeFilterModel = success;
          emit(FilterLoaded(homeFilterModel: success));
        },
      );
    }
  }
}
