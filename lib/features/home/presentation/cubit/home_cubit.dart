import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stat_doctor/features/home/data/enums/home_loading_type.dart';
import 'package:stat_doctor/features/home/data/models/home_shift_model.dart';
import 'package:stat_doctor/features/home/data/models/home_shifts_data_model.dart';
import 'package:stat_doctor/features/home/data/objects_value/filter_params.dart';
import 'package:stat_doctor/features/home/data/repository/home_repository.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository;
  HomeCubit({required this.homeRepository}) : super(HomeInitial());

  final List<HomeShiftModel> workedList = [];
  final List<HomeShiftModel> interestedList = [];
  final List<HomeShiftModel> nearList = [];

  HomeState _getHomeLoadingstate(HomeLoadingType? homeLoadingType) {
    return switch (homeLoadingType) {
      HomeLoadingType.worked => GetMoreWorkedHomeShiftsLoading(),
      HomeLoadingType.interested => GetMoreInterestedHomeShiftsLoading(),
      HomeLoadingType.near => GetMoreNearHomeShiftsLoading(),
      null => GetHomeShiftsLoading(),
    };
  }

  Future<void> getHomeShifts({required FilterParams filterParams, HomeLoadingType? homeLoadingType}) async {
    emit(_getHomeLoadingstate(homeLoadingType));
    final result = await homeRepository.getHomeShifts(filterParams);
    if (!isClosed) {
      result.fold(
        (failure) => emit(GetHomeShiftsFailure(message: failure.message)),
        (success) {
          if (homeLoadingType == null) {
            workedList.clear();
            interestedList.clear();
            nearList.clear();
          }
          workedList.addAll(success.workedList);
          interestedList.addAll(success.interestedList);
          nearList.addAll(success.nearList);
          emit(GetHomeShiftsLoaded(homeShiftsDataModel: success));
        }
      );
    }
  }
}