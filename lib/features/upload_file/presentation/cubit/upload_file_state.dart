part of 'upload_file_cubit.dart';

sealed class UploadFileState extends Equatable {
  const UploadFileState();
  @override
  List<Object> get props => [];
}

//! ================== Initial State ==================

final class UploadFileInitial extends UploadFileState {}

//! ================== Upload File State ==================

final class UploadFileLoading extends UploadFileState {}

final class UploadFileLoaded extends UploadFileState {
  final UploadFile uploadFile;
  const UploadFileLoaded({required this.uploadFile});
  @override
  List<Object> get props => [uploadFile];
}

final class UploadFileFailure extends UploadFileState {
  final String message;
  const UploadFileFailure({required this.message});
  
  @override
  List<Object> get props => [message];
}