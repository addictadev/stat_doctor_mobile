import 'package:equatable/equatable.dart';

class RegisterParams extends Equatable {
  final String code;
  final String email;
  final String firstName;
  final String profilePic;
  final String surname;
  final MedicalDTO medicalDTO;
  final List<ReferencesDTO> referencesDTOList;
  final DocDTO docDTO;

  const RegisterParams({
    required this.code,
    required this.email,
    required this.firstName,
    required this.profilePic,
    required this.surname,
    required this.medicalDTO,
    required this.referencesDTOList,
    required this.docDTO,
  });

  Map<String, dynamic> toJson() => {
    "code": code,
    "email": email,
    "firstName": firstName,
    "profilePic": profilePic,
    "surname": surname,
    "medicalDTO": medicalDTO.toJson(),
    "referencesDTOList": referencesDTOList.map((ref) => ref.toJson()).toList(),
    "docDTO": docDTO.toJson(),
  };

  @override
  List<Object?> get props => [
    code,
    email,
    firstName,
    profilePic,
    surname,
    medicalDTO,
    referencesDTOList,
    docDTO,
  ];
}

class MedicalDTO extends Equatable {
  final String abn;
  final String ahpraLicense;
  final bool ahpraLicenseFlag;
  final String ahpraNumber;
  final String medicalDegree;
  final String resumeFileName;
  final String resumeFileUrl;
  final String shortWork;
  final String skillLevel;
  final String specialties;

  const MedicalDTO({
    required this.abn,
    required this.ahpraLicense,
    required this.ahpraLicenseFlag,
    required this.ahpraNumber,
    required this.medicalDegree,
    required this.resumeFileName,
    required this.resumeFileUrl,
    required this.shortWork,
    required this.skillLevel,
    required this.specialties,
  });

  Map<String, dynamic> toJson() => {
    "abn": abn,
    "ahpraLicense": ahpraLicense,
    "ahpraLicenseFlag": ahpraLicenseFlag,
    "ahpraNumber": ahpraNumber,
    "medicalDegree": medicalDegree,
    "resumeFileName": resumeFileName,
    "resumeFileUrl": resumeFileUrl,
    "shortWork": shortWork,
    "skillLevel": skillLevel,
    "specialties": specialties,
  };

  @override
  List<Object?> get props => [
        abn,
        ahpraLicense,
        ahpraLicenseFlag,
        ahpraNumber,
        medicalDegree,
        resumeFileName,
        resumeFileUrl,
        shortWork,
        skillLevel,
        specialties,
      ];
}

class ReferencesDTO extends Equatable {
  final String email;
  final String fullName;
  final String hospitalCurrent;
  final String mobile;
  final String seniority;
  final int seq;
  final String specialty;

  const ReferencesDTO({
    required this.email,
    required this.fullName,
    required this.hospitalCurrent,
    required this.mobile,
    required this.seniority,
    required this.seq,
    required this.specialty,
  });

  Map<String, dynamic> toJson() => {
    "email": email,
    "fullName": fullName,
    "hospitalCurrent": hospitalCurrent,
    "mobile": mobile,
    "seniority": seniority,
    "seq": seq,
    "specialty": specialty,
  };

  @override
  List<Object?> get props => [
    email,
    fullName,
    hospitalCurrent,
    mobile,
    seniority,
    seq,
    specialty,
  ];
}

class DocDTO extends Equatable {
  final String approvalForSecondaryEmployment;
  final String approvalForSecondaryEmploymentExt;
  final String criminalHistoryCheck;
  final String criminalHistoryCheckExt;
  final String medicareCard;
  final String medicareCardExt;
  final String otherDocument;
  final String otherDocumentExt;
  final String medicalDegree;
  final String medicalDegreeExt;
  final String policeCheck;
  final String policeCheckExt;
  final String primaryDocument;
  final String primaryDocumentExt;
  final String threeDocument;
  final String threeDocumentExt;
  final String vaccinationCertificate;
  final String vaccinationCertificateExt;
  final String workVisa;
  final String workVisaExt;
  final String workingWithChildrenCheck;
  final String workingWithChildrenCheckExt;

  const DocDTO({
    required this.approvalForSecondaryEmployment,
    required this.approvalForSecondaryEmploymentExt,
    required this.criminalHistoryCheck,
    required this.criminalHistoryCheckExt,
    required this.medicareCard,
    required this.medicareCardExt,
    required this.otherDocument,
    required this.otherDocumentExt,
    required this.medicalDegree,
    required this.medicalDegreeExt,
    required this.policeCheck,
    required this.policeCheckExt,
    required this.primaryDocument,
    required this.primaryDocumentExt,
    required this.threeDocument,
    required this.threeDocumentExt,
    required this.vaccinationCertificate,
    required this.vaccinationCertificateExt,
    required this.workVisa,
    required this.workVisaExt,
    required this.workingWithChildrenCheck,
    required this.workingWithChildrenCheckExt,
  });

  Map<String, dynamic> toJson() => {
    "approvalForSecondaryEmployment": approvalForSecondaryEmployment,
    "approvalForSecondaryEmploymentExt": approvalForSecondaryEmploymentExt,
    "criminalHistoryCheck": criminalHistoryCheck,
    "criminalHistoryCheckExt": criminalHistoryCheckExt,
    "medicareCard": medicareCard,
    "medicareCardExt": medicareCardExt,
    "otherDocument": otherDocument,
    "otherDocumentExt": otherDocumentExt,
    "medicalDegree": medicalDegree,
    "medicalDegreeExt": medicalDegreeExt,
    "policeCheck": policeCheck,
    "policeCheckExt": policeCheckExt,
    "primaryDocument": primaryDocument,
    "primaryDocumentExt": primaryDocumentExt,
    "threeDocument": threeDocument,
    "threeDocumentExt": threeDocumentExt,
    "vaccinationCertificate": vaccinationCertificate,
    "vaccinationCertificateExt": vaccinationCertificateExt,
    "workVisa": workVisa,
    "workVisaExt": workVisaExt,
    "workingWithChildrenCheck": workingWithChildrenCheck,
    "workingWithChildrenCheckExt": workingWithChildrenCheckExt,
  };

  @override
  List<Object?> get props => [
    approvalForSecondaryEmployment,
    approvalForSecondaryEmploymentExt,
    criminalHistoryCheck,
    criminalHistoryCheckExt,
    medicareCard,
    medicareCardExt,
    otherDocument,
    otherDocumentExt,
    medicalDegree,
    medicalDegreeExt,
    policeCheck,
    policeCheckExt,
    primaryDocument,
    primaryDocumentExt,
    threeDocument,
    threeDocumentExt,
    vaccinationCertificate,
    vaccinationCertificateExt,
    workVisa,
    workVisaExt,
    workingWithChildrenCheck,
    workingWithChildrenCheckExt,
  ];
}