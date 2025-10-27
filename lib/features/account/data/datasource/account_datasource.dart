import 'package:stat_doctor/core/config/app_end_points.dart';
import 'package:stat_doctor/core/network/network_service/api_basehelper.dart';
import 'package:stat_doctor/core/network/network_service/exceptions.dart';
import 'package:stat_doctor/core/storage/data/storage.dart';
import 'package:stat_doctor/features/account/data/models/user_model.dart';

abstract class AccountDatasource {
  Future<UserModel> getProfile({bool? isCache = false});
}

class AccountDatasourceImpl implements AccountDatasource {
  final Storage storage;
  final ApiBaseHelper apiBaseHelper;
  AccountDatasourceImpl({required this.storage, required this.apiBaseHelper});

  @override
  Future<UserModel> getProfile({bool? isCache = false}) async {
    if(isCache == true) {
      UserModel? user = storage.getUserData();
      if (user != null) {
        return user;
      } else {
        throw CacheException("No User Found");
      }
    }
    final response = await apiBaseHelper.get(url: AppEndpoints.profile,);
    UserModel user = UserModel.fromJson(response['data']);
    await storage.storeUserData(user: user);
    return user;
  }
}