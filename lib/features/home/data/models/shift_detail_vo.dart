import 'package:equatable/equatable.dart';

class ShiftDetailVO extends Equatable {
  final String specialty;
  final String skillLevel;
  final String supportLevel;
  final int accommodationFlag;
  final String accommodation;
  final String travel;
  final int travelFlag;
  final String? shiftsType;
  final String? shiftsDescription;
  final List<String>? additionalFilesRequired;
  final String? otherRate;

  const ShiftDetailVO({
    required this.specialty,
    required this.skillLevel,
    required this.supportLevel,
    required this.accommodationFlag,
    required this.accommodation,
    required this.travel,
    required this.travelFlag,
    this.shiftsType,
    this.shiftsDescription,
    this.additionalFilesRequired,
    this.otherRate,
  });

  factory ShiftDetailVO.fromJson(Map<String, dynamic> json) => ShiftDetailVO(
    specialty: json['specialty'],
    skillLevel: json['skillLevel'],
    supportLevel: json['supportLevel'],
    accommodationFlag: json['accommodationFlag'],
    accommodation: json['accommodation'],
    travel: json['travel'],
    travelFlag: json['travelFlag'],
    shiftsType: json['shiftsType'],
    shiftsDescription: json['shiftsDescription'],
    additionalFilesRequired: json['additionalFilesRequired'] != null? (json['additionalFilesRequired'] as List).map((e) => e.toString()).toList() : null,
    otherRate: json['otherRate'],
  );

  Map<String, dynamic> toJson() => {
    'specialty': specialty,
    'skillLevel': skillLevel,
    'supportLevel': supportLevel,
    'accommodationFlag': accommodationFlag,
    'accommodation': accommodation,
    'travel': travel,
    'travelFlag': travelFlag,
    'shiftsType': shiftsType,
    'shiftsDescription': shiftsDescription,
    'additionalFilesRequired': additionalFilesRequired,
    'otherRate': otherRate,
  };

  @override
  List<Object?> get props => [
    specialty,
    skillLevel,
    supportLevel,
    accommodationFlag,
    accommodation,
    travel,
    travelFlag,
    shiftsType,
    shiftsDescription,
    additionalFilesRequired,
    otherRate,
  ];
}

