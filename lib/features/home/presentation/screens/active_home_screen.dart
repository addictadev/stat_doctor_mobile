import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:stat_doctor/core/toast/app_toast.dart';
import 'package:stat_doctor/features/home/data/enums/home_loading_type.dart';
import 'package:stat_doctor/features/home/data/objects_value/filter_params.dart';
import 'package:stat_doctor/features/home/data/objects_value/shift_status_params.dart';
import 'package:stat_doctor/features/home/presentation/cubit/filter_cubit.dart';
import 'package:stat_doctor/features/home/presentation/cubit/home_cubit.dart';
import 'package:stat_doctor/features/home/presentation/widgets/home_header.dart';
import 'package:stat_doctor/features/home/presentation/widgets/home_interested_shifts.dart';
import 'package:stat_doctor/features/home/presentation/widgets/home_other_shifts_filter.dart';
import 'package:stat_doctor/features/home/presentation/widgets/home_other_shifts_grid_view.dart';
import 'package:stat_doctor/features/home/presentation/widgets/home_worked_hospitals.dart';

class ActiveHomeScreen extends StatefulWidget {
  final Position position;
  const ActiveHomeScreen({super.key, required this.position});
  @override
  State<ActiveHomeScreen> createState() => _ActiveHomeScreenState();
}

class _ActiveHomeScreenState extends State<ActiveHomeScreen> {
  final ScrollController _workedScrollController = ScrollController();
  final ScrollController _interestedScrollController = ScrollController();
  final ScrollController _nearScrollController = ScrollController();
  bool _hasNextPage = false;
  Timer? _debounce;
  final TextEditingController searchController = TextEditingController();
  
  int pageNo = 0;
  ShiftStatusParams currentShiftsStatus = ShiftStatusParams.shiftStatusList.first;
  FilterParams filterParams = FilterParams();

  void _loadMoreWorkedEvents() {
    if (_workedScrollController.position.pixels == _workedScrollController.position.maxScrollExtent && _hasNextPage) {
      context.read<HomeCubit>().getHomeShifts(filterParams: filterParams, homeLoadingType: HomeLoadingType.worked,);
    }
  }

  void _loadMoreInterestedEvents() {
    if (_interestedScrollController.position.pixels == _interestedScrollController.position.maxScrollExtent && _hasNextPage) {
      context.read<HomeCubit>().getHomeShifts(filterParams: filterParams, homeLoadingType: HomeLoadingType.interested,);
    }
  }

  void _loadMoreNearEvents() {
    if (_nearScrollController.position.pixels == _nearScrollController.position.maxScrollExtent && _hasNextPage) {
      context.read<HomeCubit>().getHomeShifts(filterParams: filterParams, homeLoadingType: HomeLoadingType.near,);
    }
  }

  void _onSearchChanged(String search) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      pageNo = 0;
      filterParams = filterParams.copyWith(search: search.isNotEmpty ? search : null, pageNo: pageNo);
      context.read<HomeCubit>().getHomeShifts(filterParams: filterParams,);
    });
  }

  void _onFilter(FilterParams updatedFilterParams) {
    setState(() {
      pageNo = 0;
      filterParams = updatedFilterParams.copyWith(pageNo: pageNo);
    });
    context.read<HomeCubit>().getHomeShifts(filterParams: filterParams,);
  }

  void _onShiftsStatusChanged(ShiftStatusParams status) {
    pageNo = 0;
    setState(() {
      currentShiftsStatus = status;
      filterParams = filterParams.copyWith(status: status.status, pageNo: pageNo);
    });
    context.read<HomeCubit>().getHomeShifts(filterParams: filterParams,);
  }

  void _onShiftChanged(String shift) {
    pageNo = 0;
    setState(() {
      pageNo = 0;
      filterParams = filterParams.copyWith(selectedShift: shift, pageNo: pageNo);
    });
    context.read<HomeCubit>().getHomeShifts(filterParams: filterParams,);
  }

  @override
  void initState() {
    super.initState();
    context.read<FilterCubit>().getHomeFilter();
    filterParams = filterParams.copyWith(
      latitude: widget.position.latitude,
      longitude: widget.position.longitude,
      status: currentShiftsStatus.status,
      pageNo: pageNo,
    );
    context.read<HomeCubit>().getHomeShifts(filterParams: filterParams,);
    _workedScrollController.addListener(_loadMoreWorkedEvents);
    _interestedScrollController.addListener(_loadMoreInterestedEvents);
    _nearScrollController.addListener(_loadMoreNearEvents);
  }

  @override
  void dispose() {
    searchController.dispose();
    _workedScrollController.dispose();
    _interestedScrollController.dispose();
    _nearScrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is GetHomeShiftsFailure) {appToast(context: context, type: ToastType.error, message: state.message);}
          else if (state is GetHomeShiftsLoaded) {
            pageNo = state.homeShiftsDataModel.pageNo + 1;
            _hasNextPage = state.homeShiftsDataModel.hasNextPage;
            filterParams = filterParams.copyWith(pageNo: pageNo);
          }
        },
        child: CustomScrollView(
          controller: _nearScrollController,
          slivers: [
            HomeHeader(
              searchController: searchController,
              filterParams: filterParams,
              onFilterParamsChanged: _onFilter,
              onSearchChanged: _onSearchChanged,
            ),
            HomeWorkedHospitals(workedScrollController: _workedScrollController),
            HomeInterestedShifts(interestedScrollController: _interestedScrollController),
            HomeOtherShiftsFilter(
              filterParams: filterParams,
              currentShiftsStatus: currentShiftsStatus,
              onShiftsStatusChanged: _onShiftsStatusChanged,
              onShiftChanged: _onShiftChanged,
            ),
            HomeOtherShiftsGridView(),
            SliverToBoxAdapter(child: SizedBox(height: 125.h,),)
          ],
        ),
      ),
    );
  }
}