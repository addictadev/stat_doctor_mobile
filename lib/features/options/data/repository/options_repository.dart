import 'package:dartz/dartz.dart';
import 'package:stat_doctor/core/network/network_service/failures.dart';
import 'package:stat_doctor/core/network/network_service/repository_helper.dart';
import 'package:stat_doctor/features/options/data/datasource/options_datasource.dart';
import 'package:stat_doctor/features/options/data/enums/option_type.dart';
import 'package:stat_doctor/features/options/data/model/options.dart';

class OptionsRepository with RepositoryHelper {
  final OptionsDatasource optionsDatasource;  
  OptionsRepository({required this.optionsDatasource});
  Future<Either<Failure, List<Options>>> getOptions({required OptionType type}) async {
    return handleEither(() => optionsDatasource.getOptions(type: type));
  }
}
