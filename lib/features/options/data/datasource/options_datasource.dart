import 'package:stat_doctor/core/config/app_end_points.dart';
import 'package:stat_doctor/core/network/network_service/api_basehelper.dart';
import 'package:stat_doctor/features/options/data/enums/option_type.dart';
import 'package:stat_doctor/features/options/data/model/options.dart';

abstract class OptionsDatasource {
  Future<List<Options>> getOptions({required OptionType type});
}

class OptionsDatasourceImpl implements OptionsDatasource{
  final ApiBaseHelper apiBaseHelper;
  OptionsDatasourceImpl({required this.apiBaseHelper});

  @override
  Future<List<Options>> getOptions({required OptionType type}) async{
    final response = await apiBaseHelper.get(url: AppEndpoints.getOptions(type: type));
    List<Options> options = (response['data'] as List).map((e) => Options.fromJson(e)).toList();
    return options;
  }
}