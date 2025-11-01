import 'package:equatable/equatable.dart';
import 'package:stat_doctor/features/home/data/models/hospital_vo.dart';
import 'package:stat_doctor/features/home/data/models/shift_day_vo.dart';
import 'package:stat_doctor/features/home/data/models/shift_detail_vo.dart';

class HomeShiftModel extends Equatable {
  final String shiftsId;
  final int shiftsNo;
  final HospitalVO hospitalVO;
  final double distance;
  final List<ShiftDayVO> shiftsDaysVOList;
  final ShiftDetailVO shiftsDetailVO;
  final String accountId;
  final double? score;

  const HomeShiftModel({
    required this.shiftsId,
    required this.shiftsNo,
    required this.hospitalVO,
    required this.distance,
    required this.shiftsDaysVOList,
    required this.shiftsDetailVO,
    required this.accountId,
    this.score,
  });

  factory HomeShiftModel.fromJson(Map<String, dynamic> json) => HomeShiftModel(
    shiftsId: json['shiftsId'],
    shiftsNo: json['shiftsNo'],
    hospitalVO: HospitalVO.fromJson(json['hospitalVO']),
    distance: json['distance'],
    shiftsDaysVOList: (json['shiftsDaysVOList'] as List).map((e) => ShiftDayVO.fromJson(e)).toList(),
    shiftsDetailVO: ShiftDetailVO.fromJson(json['shiftsDetailVO']),
    accountId: json['accountId'],
    score: json['score'],
  );

  Map<String, dynamic> toJson() => {
    'shiftsId': shiftsId,
    'shiftsNo': shiftsNo,
    'hospitalVO': hospitalVO.toJson(),
    'distance': distance,
    'shiftsDaysVOList': shiftsDaysVOList.map((e) => e.toJson()).toList(),
    'shiftsDetailVO': shiftsDetailVO.toJson(),
    'accountId': accountId,
    'score': score,
  };

  @override
  List<Object?> get props => [
    shiftsId,
    shiftsNo,
    hospitalVO,
    distance,
    shiftsDaysVOList,
    shiftsDetailVO,
    accountId,
    score,
  ];
}

