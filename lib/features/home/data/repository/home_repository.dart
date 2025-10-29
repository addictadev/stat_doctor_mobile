import 'package:dartz/dartz.dart';
import 'package:stat_doctor/core/network/network_service/failures.dart';
import 'package:stat_doctor/core/network/network_service/repository_helper.dart';
import 'package:stat_doctor/features/home/data/datasource/home_datasource.dart';
import 'package:stat_doctor/features/home/data/models/home_filter_model.dart';


class HomeRepository with RepositoryHelper{
  final HomeDatasource homeDatasource;
  HomeRepository({required this.homeDatasource,});

  Future<Either<Failure, HomeFilterModel>> getHomeFilter() async {
    return handleEither(() => homeDatasource.getHomeFilter());
  }
}