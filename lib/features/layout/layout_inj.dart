import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:stat_doctor/core/injection/injection_container.dart';
import 'package:stat_doctor/features/account/presentation/cubit/account_cubit.dart';
import 'package:stat_doctor/features/layout/presentation/cubit/bnb_cubit.dart';

Future<void> initLayoutInj(GetIt sl) async{
  //* cubit
  sl.registerFactory<BnbCubit>(() => BnbCubit());
}


List<BlocProvider> appLayoutBlocs(BuildContext context) => [
  BlocProvider<BnbCubit>(create: (BuildContext context) => sl<BnbCubit>()),
  BlocProvider<AccountCubit>(create: (BuildContext context) => sl<AccountCubit>()),
];
