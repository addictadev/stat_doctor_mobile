import 'package:equatable/equatable.dart';

class ShiftDayVO extends Equatable {
  final String ordersId;
  final String shiftsDaysId;
  final int shiftsDaysNo;
  final int shiftsDay;
  final String shiftsDays;
  final int startTime;
  final int endTime;
  final String startTimeS;
  final String endTimeS;
  final String? rateType;
  final double? contractedRate;
  final String durationTime;
  final double ratePerHour;
  final bool onCallFlag;
  final String? onCallDetails;
  final int confirmedTime;
  final int archivedTime;
  final int? userCancelTime;
  final int? accountCancelTime;
  final String timeType;
  final String status;
  final bool appCancel;
  final String? docName;
  final String? link;

  const ShiftDayVO({
    required this.ordersId,
    required this.shiftsDaysId,
    required this.shiftsDaysNo,
    required this.shiftsDay,
    required this.shiftsDays,
    required this.startTime,
    required this.endTime,
    required this.startTimeS,
    required this.endTimeS,
    this.rateType,
    this.contractedRate,
    required this.durationTime,
    required this.ratePerHour,
    required this.onCallFlag,
    this.onCallDetails,
    required this.confirmedTime,
    required this.archivedTime,
    this.userCancelTime,
    this.accountCancelTime,
    required this.timeType,
    required this.status,
    required this.appCancel,
    this.docName,
    this.link,
  });

  factory ShiftDayVO.fromJson(Map<String, dynamic> json) => ShiftDayVO(
    ordersId: json['ordersId'],
    shiftsDaysId: json['shiftsDaysId'],
    shiftsDaysNo: json['shiftsDaysNo'],
    shiftsDay: json['shiftsDay'],
    shiftsDays: json['shiftsDays'],
    startTime: json['startTime'],
    endTime: json['endTime'],
    startTimeS: json['startTimeS'],
    endTimeS: json['endTimeS'],
    rateType: json['rateType'],
    contractedRate: json['contractedRate'],
    durationTime: json['durationTime'],
    ratePerHour: json['ratePerHour'],
    onCallFlag: json['onCallFlag'],
    onCallDetails: json['onCallDetails'],
    confirmedTime: json['confirmedTime'],
    archivedTime: json['archivedTime'],
    userCancelTime: json['userCancelTime'],
    accountCancelTime: json['accountCancelTime'],
    timeType: json['timeType'],
    status: json['status'],
    appCancel: json['appCancel'],
    docName: json['docName'],
    link: json['link'],
  );

  Map<String, dynamic> toJson() => {
    'ordersId': ordersId,
    'shiftsDaysId': shiftsDaysId,
    'shiftsDaysNo': shiftsDaysNo,
    'shiftsDay': shiftsDay,
    'shiftsDays': shiftsDays,
    'startTime': startTime,
    'endTime': endTime,
    'startTimeS': startTimeS,
    'endTimeS': endTimeS,
    'rateType': rateType,
    'contractedRate': contractedRate,
    'durationTime': durationTime,
    'ratePerHour': ratePerHour,
    'onCallFlag': onCallFlag,
    'onCallDetails': onCallDetails,
    'confirmedTime': confirmedTime,
    'archivedTime': archivedTime,
    'userCancelTime': userCancelTime,
    'accountCancelTime': accountCancelTime,
    'timeType': timeType,
    'status': status,
    'appCancel': appCancel,
    'docName': docName,
    'link': link,
  };

  @override
  List<Object?> get props => [
    ordersId,
    shiftsDaysId,
    shiftsDaysNo,
    shiftsDay,
    shiftsDays,
    startTime,
    endTime,
    startTimeS,
    endTimeS,
    rateType,
    contractedRate,
    durationTime,
    ratePerHour,
    onCallFlag,
    onCallDetails,
    confirmedTime,
    archivedTime,
    userCancelTime,
    accountCancelTime,
    timeType,
    status,
    appCancel,
    docName,
    link,
  ];
}

