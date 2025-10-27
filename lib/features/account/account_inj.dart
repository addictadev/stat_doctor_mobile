import 'package:stat_doctor/features/account/data/datasource/account_datasource.dart';
import 'package:stat_doctor/features/account/data/repository/account_repoistory.dart';
import 'package:stat_doctor/features/account/presentation/cubit/account_cubit.dart';
import 'package:get_it/get_it.dart';


Future<void> initAccountInjection(GetIt sl) async {
  //* cubit
  sl.registerFactory<AccountCubit>(() => AccountCubit(accountRepoistory: sl()));

  //* repository
  sl.registerLazySingleton<AccountRepoistory>(() => AccountRepoistory(accountDatasource: sl(), internetConnection: sl()));

  //* Data sources
  sl.registerLazySingleton<AccountDatasource>(() => AccountDatasourceImpl(storage: sl(), apiBaseHelper: sl()));
}
