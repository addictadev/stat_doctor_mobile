import 'package:stat_doctor/features/upload_file/data/repository/upload_file_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stat_doctor/features/upload_file/model/upload_file.dart';
part 'upload_file_state.dart';

class UploadFileCubit extends Cubit<UploadFileState> {
  final UploadFileRepository uploadFileRepository;
  
  UploadFileCubit({required this.uploadFileRepository}) : super(UploadFileInitial());

  Future<void> uploadFile({required String filePath}) async {
    emit(UploadFileLoading());
    final result = await uploadFileRepository.uploadMultipleFiles(filePath: filePath);
    if (!isClosed) {
      result.fold(
        (failure) => emit(UploadFileFailure(message: failure.message)),
        (success) => emit(UploadFileLoaded(uploadFile: success)),
      );  
    }
  }
}