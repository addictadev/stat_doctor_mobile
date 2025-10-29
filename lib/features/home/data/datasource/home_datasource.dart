import 'package:stat_doctor/core/config/app_end_points.dart';
import 'package:stat_doctor/core/network/network_service/api_basehelper.dart';
import 'package:stat_doctor/features/home/data/models/home_filter_model.dart';

abstract class HomeDatasource {
  Future<HomeFilterModel> getHomeFilter();
}

class HomeDatasourceImpl implements HomeDatasource {
  final ApiBaseHelper apiBaseHelper;
  HomeDatasourceImpl({required this.apiBaseHelper});

  @override
  Future<HomeFilterModel> getHomeFilter() async {
    final response = await apiBaseHelper.get(url: AppEndpoints.homeFilters);
    HomeFilterModel result = HomeFilterModel.fromJson(response['data']);
    return result;
  }
}