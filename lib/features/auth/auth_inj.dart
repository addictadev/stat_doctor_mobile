import 'package:stat_doctor/features/auth/data/datasource/auth_datasource.dart';
import 'package:stat_doctor/features/auth/data/repository/auth_repository.dart';
import 'package:stat_doctor/features/auth/presenation/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';


Future<void> initAuthInjection(GetIt sl) async {
  //* cubit
  sl.registerFactory<AuthCubit>(() => AuthCubit(authRepository: sl(),));

  //* repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepository(authDatasource: sl()));

  //* Data sources
  sl.registerLazySingleton<AuthDatasource>(() => AuthDatasourceImpl(storage: sl(), apiBaseHelper: sl()));
}