import 'package:equatable/equatable.dart';

class UploadFileModel extends Equatable {
  final String fileUrl;
  final String fileName;

  const UploadFileModel({required this.fileUrl, required this.fileName});

  @override
  List<Object?> get props => [fileUrl, fileName];
}