import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'doc_vo.g.dart';

@HiveType(typeId: 4)
class DocVO extends Equatable {
  @HiveField(0)
  final String primaryDocumentExt;
  @HiveField(1)
  final String otherDocumentExt;
  @HiveField(2)
  final String threeDocumentExt;
  @HiveField(3)
  final String primaryDocument;
  @HiveField(4)
  final String otherDocument;
  @HiveField(5)
  final String threeDocument;
  @HiveField(6)
  final String policeCheck;
  @HiveField(7)
  final String workVisa;
  @HiveField(8)
  final String criminalHistoryCheck;
  @HiveField(9)
  final String workingWithChildrenCheck;
  @HiveField(10)
  final String vaccinationCertificate;
  @HiveField(11)
  final String medicareCard;
  @HiveField(12)
  final String approvalForSecondaryEmployment;
  @HiveField(13)
  final String policeCheckExt;
  @HiveField(14)
  final String workVisaExt;
  @HiveField(15)
  final String criminalHistoryCheckExt;
  @HiveField(16)
  final String workingWithChildrenCheckExt;
  @HiveField(17)
  final String vaccinationCertificateExt;
  @HiveField(18)
  final String medicareCardExt;
  @HiveField(19)
  final String approvalForSecondaryEmploymentExt;
  @HiveField(20)
  final String referral;
  @HiveField(21)
  final String? referralExt;
  @HiveField(22)
  final String medicalDegree;
  @HiveField(23)
  final String medicalDegreeExt;
  @HiveField(24)
  final int createTime;
  @HiveField(25)
  final int updatedTime;

  const DocVO({
    required this.primaryDocumentExt,
    required this.otherDocumentExt,
    required this.threeDocumentExt,
    required this.primaryDocument,
    required this.otherDocument,
    required this.threeDocument,
    required this.policeCheck,
    required this.workVisa,
    required this.criminalHistoryCheck,
    required this.workingWithChildrenCheck,
    required this.vaccinationCertificate,
    required this.medicareCard,
    required this.approvalForSecondaryEmployment,
    required this.policeCheckExt,
    required this.workVisaExt,
    required this.criminalHistoryCheckExt,
    required this.workingWithChildrenCheckExt,
    required this.vaccinationCertificateExt,
    required this.medicareCardExt,
    required this.approvalForSecondaryEmploymentExt,
    required this.referral,
    this.referralExt,
    required this.medicalDegree,
    required this.medicalDegreeExt,
    required this.createTime,
    required this.updatedTime,
  });

  factory DocVO.fromJson(Map<String, dynamic> json) {
    return DocVO(
      primaryDocumentExt: json['primaryDocumentExt'] ?? '',
      otherDocumentExt: json['otherDocumentExt'] ?? '',
      threeDocumentExt: json['threeDocumentExt'] ?? '',
      primaryDocument: json['primaryDocument'] ?? '',
      otherDocument: json['otherDocument'] ?? '',
      threeDocument: json['threeDocument'] ?? '',
      policeCheck: json['policeCheck'] ?? '',
      workVisa: json['workVisa'] ?? '',
      criminalHistoryCheck: json['criminalHistoryCheck'] ?? '',
      workingWithChildrenCheck: json['workingWithChildrenCheck'] ?? '',
      vaccinationCertificate: json['vaccinationCertificate'] ?? '',
      medicareCard: json['medicareCard'] ?? '',
      approvalForSecondaryEmployment: json['approvalForSecondaryEmployment'] ?? '',
      policeCheckExt: json['policeCheckExt'] ?? '',
      workVisaExt: json['workVisaExt'] ?? '',
      criminalHistoryCheckExt: json['criminalHistoryCheckExt'] ?? '',
      workingWithChildrenCheckExt: json['workingWithChildrenCheckExt'] ?? '',
      vaccinationCertificateExt: json['vaccinationCertificateExt'] ?? '',
      medicareCardExt: json['medicareCardExt'] ?? '',
      approvalForSecondaryEmploymentExt: json['approvalForSecondaryEmploymentExt'] ?? '',
      referral: json['referral'] ?? '',
      referralExt: json['referralExt'],
      medicalDegree: json['medicalDegree'] ?? '',
      medicalDegreeExt: json['medicalDegreeExt'] ?? '',
      createTime: json['createTime'] ?? 0,
      updatedTime: json['updatedTime'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'primaryDocumentExt': primaryDocumentExt,
      'otherDocumentExt': otherDocumentExt,
      'threeDocumentExt': threeDocumentExt,
      'primaryDocument': primaryDocument,
      'otherDocument': otherDocument,
      'threeDocument': threeDocument,
      'policeCheck': policeCheck,
      'workVisa': workVisa,
      'criminalHistoryCheck': criminalHistoryCheck,
      'workingWithChildrenCheck': workingWithChildrenCheck,
      'vaccinationCertificate': vaccinationCertificate,
      'medicareCard': medicareCard,
      'approvalForSecondaryEmployment': approvalForSecondaryEmployment,
      'policeCheckExt': policeCheckExt,
      'workVisaExt': workVisaExt,
      'criminalHistoryCheckExt': criminalHistoryCheckExt,
      'workingWithChildrenCheckExt': workingWithChildrenCheckExt,
      'vaccinationCertificateExt': vaccinationCertificateExt,
      'medicareCardExt': medicareCardExt,
      'approvalForSecondaryEmploymentExt': approvalForSecondaryEmploymentExt,
      'referral': referral,
      'referralExt': referralExt,
      'medicalDegree': medicalDegree,
      'medicalDegreeExt': medicalDegreeExt,
      'createTime': createTime,
      'updatedTime': updatedTime,
    };
  }

  DocVO copyWith({
    String? primaryDocumentExt,
    String? otherDocumentExt,
    String? threeDocumentExt,
    String? primaryDocument,
    String? otherDocument,
    String? threeDocument,
    String? policeCheck,
    String? workVisa,
    String? criminalHistoryCheck,
    String? workingWithChildrenCheck,
    String? vaccinationCertificate,
    String? medicareCard,
    String? approvalForSecondaryEmployment,
    String? policeCheckExt,
    String? workVisaExt,
    String? criminalHistoryCheckExt,
    String? workingWithChildrenCheckExt,
    String? vaccinationCertificateExt,
    String? medicareCardExt,
    String? approvalForSecondaryEmploymentExt,
    String? referral,
    String? referralExt,
    String? medicalDegree,
    String? medicalDegreeExt,
    int? createTime,
    int? updatedTime,
  }) {
    return DocVO(
      primaryDocumentExt: primaryDocumentExt ?? this.primaryDocumentExt,
      otherDocumentExt: otherDocumentExt ?? this.otherDocumentExt,
      threeDocumentExt: threeDocumentExt ?? this.threeDocumentExt,
      primaryDocument: primaryDocument ?? this.primaryDocument,
      otherDocument: otherDocument ?? this.otherDocument,
      threeDocument: threeDocument ?? this.threeDocument,
      policeCheck: policeCheck ?? this.policeCheck,
      workVisa: workVisa ?? this.workVisa,
      criminalHistoryCheck: criminalHistoryCheck ?? this.criminalHistoryCheck,
      workingWithChildrenCheck: workingWithChildrenCheck ?? this.workingWithChildrenCheck,
      vaccinationCertificate: vaccinationCertificate ?? this.vaccinationCertificate,
      medicareCard: medicareCard ?? this.medicareCard,
      approvalForSecondaryEmployment: approvalForSecondaryEmployment ?? this.approvalForSecondaryEmployment,
      policeCheckExt: policeCheckExt ?? this.policeCheckExt,
      workVisaExt: workVisaExt ?? this.workVisaExt,
      criminalHistoryCheckExt: criminalHistoryCheckExt ?? this.criminalHistoryCheckExt,
      workingWithChildrenCheckExt: workingWithChildrenCheckExt ?? this.workingWithChildrenCheckExt,
      vaccinationCertificateExt: vaccinationCertificateExt ?? this.vaccinationCertificateExt,
      medicareCardExt: medicareCardExt ?? this.medicareCardExt,
      approvalForSecondaryEmploymentExt: approvalForSecondaryEmploymentExt ?? this.approvalForSecondaryEmploymentExt,
      referral: referral ?? this.referral,
      referralExt: referralExt ?? this.referralExt,
      medicalDegree: medicalDegree ?? this.medicalDegree,
      medicalDegreeExt: medicalDegreeExt ?? this.medicalDegreeExt,
      createTime: createTime ?? this.createTime,
      updatedTime: updatedTime ?? this.updatedTime,
    );
  }

  @override
  List<Object?> get props => [
        primaryDocumentExt,
        otherDocumentExt,
        threeDocumentExt,
        primaryDocument,
        otherDocument,
        threeDocument,
        policeCheck,
        workVisa,
        criminalHistoryCheck,
        workingWithChildrenCheck,
        vaccinationCertificate,
        medicareCard,
        approvalForSecondaryEmployment,
        policeCheckExt,
        workVisaExt,
        criminalHistoryCheckExt,
        workingWithChildrenCheckExt,
        vaccinationCertificateExt,
        medicareCardExt,
        approvalForSecondaryEmploymentExt,
        referral,
        referralExt,
        medicalDegree,
        medicalDegreeExt,
        createTime,
        updatedTime,
      ];
}
