import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:stat_doctor/core/injection/injection_container.dart';
import 'package:stat_doctor/features/home/presentation/cubit/location_cubit.dart';
import 'package:stat_doctor/features/options/presentation/cubit/options_cubit.dart';

Future<void> initHomeInj(GetIt sl) async{
  //* cubit
  sl.registerFactory<LocationCubit>(() => LocationCubit());
}


List<BlocProvider> appHomeBlocs(BuildContext context) => [
  BlocProvider<LocationCubit>(create: (BuildContext context) => sl<LocationCubit>()),
  BlocProvider<OptionsCubit>(create: (BuildContext context) => sl<OptionsCubit>()),
];