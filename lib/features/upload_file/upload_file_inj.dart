import 'package:stat_doctor/features/upload_file/data/datasource/upload_file_datasource.dart';
import 'package:stat_doctor/features/upload_file/data/repository/upload_file_repository.dart';
import 'package:stat_doctor/features/upload_file/presentation/cubit/upload_file_cubit.dart';
import 'package:get_it/get_it.dart';

Future<void> initUploadFileInjection(GetIt sl) async {
  //* cubit
  sl.registerFactory<UploadFileCubit>(() => UploadFileCubit(uploadFileRepository: sl()));

  //* repository
  sl.registerLazySingleton<UploadFileRepository>(() => UploadFileRepository(uploadFileDatasource: sl()));

  //* Data sources
  sl.registerLazySingleton<UploadFileDatasource>(() => UploadFileDatasourceImpl(apiBaseHelper: sl()));
}