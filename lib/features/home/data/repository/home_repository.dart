import 'package:dartz/dartz.dart';
import 'package:stat_doctor/core/network/network_service/failures.dart';
import 'package:stat_doctor/core/network/network_service/repository_helper.dart';
import 'package:stat_doctor/features/home/data/datasource/home_datasource.dart';
import 'package:stat_doctor/features/home/data/models/home_filter_model.dart';
import 'package:stat_doctor/features/home/data/models/home_shifts_data_model.dart';
import 'package:stat_doctor/features/home/data/objects_value/filter_params.dart';


class HomeRepository with RepositoryHelper{
  final HomeDatasource homeDatasource;
  HomeRepository({required this.homeDatasource,});

  Future<Either<Failure, HomeFilterModel>> getHomeFilter() async {
    return handleEither(() => homeDatasource.getHomeFilter());
  }

  Future<Either<Failure, HomeShiftsDataModel>> getHomeShifts(FilterParams filterParams) async {
    return handleEither(() => homeDatasource.getHomeShifts(filterParams));
  }

  Future<Either<Failure, String>> addToFavorite({required String hospitalAccountId}) async {
    return handleEither(() => homeDatasource.addToFavorite(hospitalAccountId: hospitalAccountId));
  }

  Future<Either<Failure, String>> removeFromFavorite({required String hospitalAccountId}) async {
    return handleEither(() => homeDatasource.removeFromFavorite(hospitalAccountId: hospitalAccountId));
  }
}