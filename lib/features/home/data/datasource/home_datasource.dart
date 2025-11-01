import 'package:stat_doctor/core/config/app_end_points.dart';
import 'package:stat_doctor/core/network/network_service/api_basehelper.dart';
import 'package:stat_doctor/features/home/data/models/home_filter_model.dart';
import 'package:stat_doctor/features/home/data/models/home_shifts_data_model.dart';
import 'package:stat_doctor/features/home/data/objects_value/filter_params.dart';

abstract class HomeDatasource {
  Future<HomeFilterModel> getHomeFilter();
  Future<HomeShiftsDataModel> getHomeShifts(FilterParams filterParams);
  Future<String> addToFavorite({required String hospitalAccountId});
  Future<String> removeFromFavorite({required String hospitalAccountId});


}

class HomeDatasourceImpl implements HomeDatasource {
  final ApiBaseHelper apiBaseHelper;
  HomeDatasourceImpl({required this.apiBaseHelper});

  @override
  Future<HomeFilterModel> getHomeFilter() async {
    final response = await apiBaseHelper.get(url: AppEndpoints.homeFilters);
    HomeFilterModel result = HomeFilterModel.fromJson(response['data']);
    result = result.copyWith(timeType: ["All", ...result.timeType]);
    return result;
  }

  @override
  Future<HomeShiftsDataModel> getHomeShifts(FilterParams filterParams) async {
    final response = await apiBaseHelper.post(
      url: AppEndpoints.homeShifts(page: filterParams.pageNo, status: filterParams.status ?? ''),
      body: filterParams.toJson()
    );
    HomeShiftsDataModel result = HomeShiftsDataModel.fromJson(response['data']);
    bool hasNextPage = result.interestedList.isNotEmpty || result.nearList.isNotEmpty || result.workedList.isNotEmpty;
    return result.copyWith(hasNextPage: hasNextPage);
  }

  @override
  Future<String> addToFavorite({required String hospitalAccountId}) async {
    final response = await apiBaseHelper.post(url: AppEndpoints.addToFavorite(hospitalAccountId: hospitalAccountId));
    return response['message'];
  }

  @override
  Future<String> removeFromFavorite({required String hospitalAccountId}) async {
    final response = await apiBaseHelper.post(url: AppEndpoints.removeFromFavorite(hospitalAccountId: hospitalAccountId));
    return response['message'];
  }
}