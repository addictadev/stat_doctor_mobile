import 'package:stat_doctor/core/navigation/navigation_inj.dart';
import 'package:stat_doctor/core/network/network_service_inj.dart';
import 'package:stat_doctor/core/services/media_service_inj.dart';
import 'package:stat_doctor/core/storage/storage_inj.dart';
import 'package:stat_doctor/features/account/account_inj.dart';
import 'package:stat_doctor/features/options/options_inj.dart';
import 'package:stat_doctor/features/upload_file/upload_file_inj.dart';
import 'package:get_it/get_it.dart';
import 'package:stat_doctor/features/auth/auth_inj.dart';
import 'package:stat_doctor/features/layout/layout_inj.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  await initStorageInjection(sl);
  initNavigationInjection(sl);
  initNetworkServiceInjection(sl);
  initMediaServiceInjection(sl);
  initLayoutInj(sl);
  initAuthInjection(sl);
  initUploadFileInjection(sl);
  initOptionsInjection(sl);
  initAccountInjection(sl);
}
