import 'package:dartz/dartz.dart';
import 'package:stat_doctor/core/network/network_service/failures.dart';
import 'package:stat_doctor/core/network/network_service/repository_helper.dart';
import 'package:stat_doctor/features/upload_file/data/datasource/upload_file_datasource.dart';
import 'package:stat_doctor/features/upload_file/model/upload_file.dart';


class UploadFileRepository with RepositoryHelper {
  final UploadFileDatasource uploadFileDatasource;  
  UploadFileRepository({required this.uploadFileDatasource});
  Future<Either<Failure, UploadFile>> uploadMultipleFiles({required String filePath}) async {
    return handleEither(() => uploadFileDatasource.uploadMultipleFiles(filePath: filePath));
  }
}
