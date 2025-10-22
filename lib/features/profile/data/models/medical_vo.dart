import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'medical_vo.g.dart';

@HiveType(typeId: 2)
class MedicalVO extends Equatable {
  @HiveField(0)
  final String medicalDegree;
  @HiveField(1)
  final String skillLevel;
  @HiveField(2)
  final String specialties;
  @HiveField(3)
  final String ahpraNumber;
  @HiveField(4)
  final String ahpraLicense;
  @HiveField(5)
  final bool ahpraLicenseFlag;
  @HiveField(6)
  final String abn;
  @HiveField(7)
  final String shortWork;
  @HiveField(8)
  final String resumeFileName;
  @HiveField(9)
  final String resumeFileUrl;
  @HiveField(10)
  final int createTime;
  @HiveField(11)
  final int updatedTime;

  const MedicalVO({
    required this.medicalDegree,
    required this.skillLevel,
    required this.specialties,
    required this.ahpraNumber,
    required this.ahpraLicense,
    required this.ahpraLicenseFlag,
    required this.abn,
    required this.shortWork,
    required this.resumeFileName,
    required this.resumeFileUrl,
    required this.createTime,
    required this.updatedTime,
  });

  factory MedicalVO.fromJson(Map<String, dynamic> json) {
    return MedicalVO(
      medicalDegree: json['medicalDegree'] ?? '',
      skillLevel: json['skillLevel'] ?? '',
      specialties: json['specialties'] ?? '',
      ahpraNumber: json['ahpraNumber'] ?? '',
      ahpraLicense: json['ahpraLicense'] ?? '',
      ahpraLicenseFlag: json['ahpraLicenseFlag'] ?? false,
      abn: json['abn'] ?? '',
      shortWork: json['shortWork'] ?? '',
      resumeFileName: json['resumeFileName'] ?? '',
      resumeFileUrl: json['resumeFileUrl'] ?? '',
      createTime: json['createTime'] ?? 0,
      updatedTime: json['updatedTime'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'medicalDegree': medicalDegree,
      'skillLevel': skillLevel,
      'specialties': specialties,
      'ahpraNumber': ahpraNumber,
      'ahpraLicense': ahpraLicense,
      'ahpraLicenseFlag': ahpraLicenseFlag,
      'abn': abn,
      'shortWork': shortWork,
      'resumeFileName': resumeFileName,
      'resumeFileUrl': resumeFileUrl,
      'createTime': createTime,
      'updatedTime': updatedTime,
    };
  }

  MedicalVO copyWith({
    String? medicalDegree,
    String? skillLevel,
    String? specialties,
    String? ahpraNumber,
    String? ahpraLicense,
    bool? ahpraLicenseFlag,
    String? abn,
    String? shortWork,
    String? resumeFileName,
    String? resumeFileUrl,
    int? createTime,
    int? updatedTime,
  }) {
    return MedicalVO(
      medicalDegree: medicalDegree ?? this.medicalDegree,
      skillLevel: skillLevel ?? this.skillLevel,
      specialties: specialties ?? this.specialties,
      ahpraNumber: ahpraNumber ?? this.ahpraNumber,
      ahpraLicense: ahpraLicense ?? this.ahpraLicense,
      ahpraLicenseFlag: ahpraLicenseFlag ?? this.ahpraLicenseFlag,
      abn: abn ?? this.abn,
      shortWork: shortWork ?? this.shortWork,
      resumeFileName: resumeFileName ?? this.resumeFileName,
      resumeFileUrl: resumeFileUrl ?? this.resumeFileUrl,
      createTime: createTime ?? this.createTime,
      updatedTime: updatedTime ?? this.updatedTime,
    );
  }

  @override
  List<Object?> get props => [
        medicalDegree,
        skillLevel,
        specialties,
        ahpraNumber,
        ahpraLicense,
        ahpraLicenseFlag,
        abn,
        shortWork,
        resumeFileName,
        resumeFileUrl,
        createTime,
        updatedTime,
      ];
}
