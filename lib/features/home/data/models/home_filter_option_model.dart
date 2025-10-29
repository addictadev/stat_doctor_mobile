import 'package:equatable/equatable.dart';

class HomeFilterOptionModel extends Equatable {
  final String id;
  final String name;

  const HomeFilterOptionModel({required this.id, required this.name});

  factory HomeFilterOptionModel.fromJson(Map<String, dynamic> json) => HomeFilterOptionModel(
    id: json['sysId'],
    name: json['sysName'],
  );

  Map<String, dynamic> toJson() => {
    'sysId': id,
    'sysName': name,
  };

  @override
  List<Object?> get props => [id, name];
}