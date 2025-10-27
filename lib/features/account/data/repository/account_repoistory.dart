import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:stat_doctor/core/network/network_service/failures.dart';
import 'package:stat_doctor/core/network/network_service/repository_helper.dart';
import 'package:stat_doctor/features/account/data/datasource/account_datasource.dart';
import 'package:stat_doctor/features/account/data/models/user_model.dart';


class AccountRepoistory with RepositoryHelper {
  final AccountDatasource accountDatasource;
  final InternetConnection internetConnection;
  AccountRepoistory({required this.internetConnection, required this.accountDatasource});


  Future<UserModel> _fetchAndCacheProfile() async{
    bool getFromCache = !(await internetConnection.hasInternetAccess);
    UserModel user = await accountDatasource.getProfile(isCache: getFromCache);
    return user;
  }
  
  Future<Either<Failure, UserModel>> getProfile() async {
    return await handleEither(() => _fetchAndCacheProfile());
  }
}