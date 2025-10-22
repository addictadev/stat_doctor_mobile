import 'package:equatable/equatable.dart';

class Options extends Equatable {
  final String id;
  final String type;
  final String name;
  final int? value;
  final int? valueTwo;

  const Options({
    required this.id,
    required this.type,
    required this.name,
    this.value,
    this.valueTwo,
  });

  factory Options.fromJson(Map<String, dynamic> json) {
    return Options(
      id: json['sysId'],
      type: json['sysType'],
      name: json['sysName'],
      value: json['sysValue'],
      valueTwo: json['sysValueTwo'],
    );
  }

  @override
  List<Object?> get props => [id, type, name, value, valueTwo];
  
}