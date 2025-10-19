import 'package:stat_doctor/features/options/data/datasource/options_datasource.dart';
import 'package:stat_doctor/features/options/data/repository/options_repository.dart';
import 'package:stat_doctor/features/options/presentation/cubit/options_cubit.dart';
import 'package:get_it/get_it.dart';

Future<void> initOptionsInjection(GetIt sl) async {
  //* cubit
  sl.registerFactory<OptionsCubit>(() => OptionsCubit(optionsRepository: sl()));
  
  //* repository
  sl.registerLazySingleton<OptionsRepository>(() => OptionsRepository(optionsDatasource: sl()));

  //* Data sources
  sl.registerLazySingleton<OptionsDatasource>(() => OptionsDatasourceImpl(apiBaseHelper: sl()));
}