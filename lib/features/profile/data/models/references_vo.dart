import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'references_vo.g.dart';

@HiveType(typeId: 3)
class ReferencesVO extends Equatable {
  @HiveField(0)
  final String verifiedCode;
  @HiveField(1)
  final int seq;
  @HiveField(2)
  final String fullName;
  @HiveField(3)
  final String mobile;
  @HiveField(4)
  final String email;
  @HiveField(5)
  final String specialty;
  @HiveField(6)
  final String seniority;
  @HiveField(7)
  final String hospitalCurrent;
  @HiveField(8)
  final int verifiedTime;
  @HiveField(9)
  final int dueTime;
  @HiveField(10)
  final String verifiedUrl;
  @HiveField(11)
  final String verifiedUrlExt;
  @HiveField(12)
  final int createTime;
  @HiveField(13)
  final int updatedTime;

  const ReferencesVO({
    required this.verifiedCode,
    required this.seq,
    required this.fullName,
    required this.mobile,
    required this.email,
    required this.specialty,
    required this.seniority,
    required this.hospitalCurrent,
    required this.verifiedTime,
    required this.dueTime,
    required this.verifiedUrl,
    required this.verifiedUrlExt,
    required this.createTime,
    required this.updatedTime,
  });

  factory ReferencesVO.fromJson(Map<String, dynamic> json) {
    return ReferencesVO(
      verifiedCode: json['verifiedCode'] ?? '',
      seq: json['seq'] ?? 0,
      fullName: json['fullName'] ?? '',
      mobile: json['mobile'] ?? '',
      email: json['email'] ?? '',
      specialty: json['specialty'] ?? '',
      seniority: json['seniority'] ?? '',
      hospitalCurrent: json['hospitalCurrent'] ?? '',
      verifiedTime: json['verifiedTime'] ?? 0,
      dueTime: json['dueTime'] ?? 0,
      verifiedUrl: json['verifiedUrl'] ?? '',
      verifiedUrlExt: json['verifiedUrlExt'] ?? '',
      createTime: json['createTime'] ?? 0,
      updatedTime: json['updatedTime'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'verifiedCode': verifiedCode,
      'seq': seq,
      'fullName': fullName,
      'mobile': mobile,
      'email': email,
      'specialty': specialty,
      'seniority': seniority,
      'hospitalCurrent': hospitalCurrent,
      'verifiedTime': verifiedTime,
      'dueTime': dueTime,
      'verifiedUrl': verifiedUrl,
      'verifiedUrlExt': verifiedUrlExt,
      'createTime': createTime,
      'updatedTime': updatedTime,
    };
  }

  ReferencesVO copyWith({
    String? verifiedCode,
    int? seq,
    String? fullName,
    String? mobile,
    String? email,
    String? specialty,
    String? seniority,
    String? hospitalCurrent,
    int? verifiedTime,
    int? dueTime,
    String? verifiedUrl,
    String? verifiedUrlExt,
    int? createTime,
    int? updatedTime,
  }) {
    return ReferencesVO(
      verifiedCode: verifiedCode ?? this.verifiedCode,
      seq: seq ?? this.seq,
      fullName: fullName ?? this.fullName,
      mobile: mobile ?? this.mobile,
      email: email ?? this.email,
      specialty: specialty ?? this.specialty,
      seniority: seniority ?? this.seniority,
      hospitalCurrent: hospitalCurrent ?? this.hospitalCurrent,
      verifiedTime: verifiedTime ?? this.verifiedTime,
      dueTime: dueTime ?? this.dueTime,
      verifiedUrl: verifiedUrl ?? this.verifiedUrl,
      verifiedUrlExt: verifiedUrlExt ?? this.verifiedUrlExt,
      createTime: createTime ?? this.createTime,
      updatedTime: updatedTime ?? this.updatedTime,
    );
  }

  @override
  List<Object?> get props => [
        verifiedCode,
        seq,
        fullName,
        mobile,
        email,
        specialty,
        seniority,
        hospitalCurrent,
        verifiedTime,
        dueTime,
        verifiedUrl,
        verifiedUrlExt,
        createTime,
        updatedTime,
      ];
}
