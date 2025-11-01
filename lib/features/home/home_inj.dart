import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:stat_doctor/core/injection/injection_container.dart';
import 'package:stat_doctor/features/home/data/datasource/home_datasource.dart';
import 'package:stat_doctor/features/home/data/repository/home_repository.dart';
import 'package:stat_doctor/features/home/presentation/cubit/filter_cubit.dart';
import 'package:stat_doctor/features/home/presentation/cubit/home_cubit.dart';
import 'package:stat_doctor/features/home/presentation/cubit/location_cubit.dart';

Future<void> initHomeInj(GetIt sl) async{
  //* cubit
  sl.registerFactory<LocationCubit>(() => LocationCubit());
  sl.registerFactory<FilterCubit>(() => FilterCubit(homeRepository: sl()));
  sl.registerFactory<HomeCubit>(() => HomeCubit(homeRepository: sl()));

  // * repository
  sl.registerLazySingleton<HomeRepository>(() => HomeRepository(homeDatasource: sl()));

  //* data sources
  sl.registerLazySingleton<HomeDatasource>(() => HomeDatasourceImpl(apiBaseHelper: sl()));
}


List<BlocProvider> appHomeBlocs(BuildContext context) => [
  BlocProvider<LocationCubit>(create: (BuildContext context) => sl<LocationCubit>()),
  BlocProvider<FilterCubit>(create: (BuildContext context) => sl<FilterCubit>()),
  BlocProvider<HomeCubit>(create: (BuildContext context) => sl<HomeCubit>()),
];