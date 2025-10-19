import 'package:get_it/get_it.dart';
import 'package:stat_doctor/features/layout/presentation/cubit/bnb_cubit.dart';

Future<void> initLayoutInj(GetIt sl) async{
  //* cubit
  sl.registerFactory<BnbCubit>(() => BnbCubit());
}