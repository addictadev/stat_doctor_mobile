import 'package:equatable/equatable.dart';

class UploadFile extends Equatable {
  final String url;
  final String name;
  final String path;

  const UploadFile({required this.url, required this.name, required this.path});

  factory UploadFile.fromJson(Map<String, dynamic> json) {
    return UploadFile(url: json['fileUrl'], name: json['fileName'], path: '');
  }

  UploadFile copyWith({String? url, String? name, String? path}) {
    return UploadFile(url: url ?? this.url, name: name ?? this.name, path: path ?? this.path);
  }

  @override
  List<Object?> get props => [url, name];
}