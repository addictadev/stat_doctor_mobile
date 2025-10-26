import 'package:get_it/get_it.dart';
import 'package:stat_doctor/core/storage/data/storage.dart';
import 'package:stat_doctor/core/storage/data/storage_impl.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stat_doctor/features/account/data/models/doc_vo.dart';
import 'package:stat_doctor/features/account/data/models/medical_vo.dart';
import 'package:stat_doctor/features/account/data/models/references_vo.dart';
import 'package:stat_doctor/features/account/data/models/user_info_vo.dart';
import 'package:stat_doctor/features/account/data/models/user_model.dart';


Future<void> initStorageInjection(GetIt sl) async {
  //! Get App Directory and Init Hive
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);

  //! Register Models
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(UserInfoVOAdapter());
  Hive.registerAdapter(MedicalVOAdapter());
  Hive.registerAdapter(ReferencesVOAdapter());
  Hive.registerAdapter(DocVOAdapter());

  
  //! Open Boxes
  Box<String> stringBox = await Hive.openBox<String>('stringBox');
  Box<bool> boolBox = await Hive.openBox<bool>('boolBox');
  Box<UserModel> userBox = await Hive.openBox<UserModel>('userBox');


  //! Injection
  sl.registerLazySingleton<Box<String>>(() => stringBox);
  sl.registerLazySingleton<Box<bool>>(() => boolBox);
  sl.registerLazySingleton<Box<UserModel>>(() => userBox);

  sl.registerFactory<Storage>(()=> StorageImpl(stringBox: sl(), boolBox: sl(), userBox: sl()));
}