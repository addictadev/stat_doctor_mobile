import 'package:stat_doctor/core/config/app_end_points.dart';
import 'package:stat_doctor/core/methods/convert_network_files.dart';
import 'package:stat_doctor/core/network/network_service/api_basehelper.dart';
import 'package:stat_doctor/features/upload_file/model/upload_file.dart';

abstract class UploadFileDatasource {
  Future<UploadFile> uploadMultipleFiles({required String filePath});
}

class UploadFileDatasourceImpl implements UploadFileDatasource{
  final ApiBaseHelper apiBaseHelper;
  UploadFileDatasourceImpl({required this.apiBaseHelper});

  @override
  Future<UploadFile> uploadMultipleFiles({required String filePath}) async{
    final formData = await ConvertNetworkFiles.formDataFromFilePath(path: filePath);
    final response = await apiBaseHelper.post(url: AppEndpoints.uploadMultipleFiles, formData: formData,);
    UploadFile uploadFile = UploadFile.fromJson(response['data'][0]);
    uploadFile = uploadFile.copyWith(path: filePath);
    return uploadFile;
  }
}