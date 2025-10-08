/// Model for the complete registration request
class RegistrationRequestModel {
  final String code;
  final String email;
  final String firstName;
  final String profilePic;
  final String surname;
  final MedicalDTO medicalDTO;
  final List<ReferencesDTO> referencesDTOList;
  final DocDTO docDTO;

  RegistrationRequestModel({
    required this.code,
    required this.email,
    required this.firstName,
    required this.profilePic,
    required this.surname,
    required this.medicalDTO,
    required this.referencesDTOList,
    required this.docDTO,
  });

  factory RegistrationRequestModel.fromJson(Map<String, dynamic> json) {
    return RegistrationRequestModel(
      code: json['code'] ?? '',
      email: json['email'] ?? '',
      firstName: json['firstName'] ?? '',
      profilePic: json['profilePic'] ?? '',
      surname: json['surname'] ?? '',
      medicalDTO: MedicalDTO.fromJson(json['medicalDTO'] ?? {}),
      referencesDTOList: (json['referencesDTOList'] as List<dynamic>?)
              ?.map((e) => ReferencesDTO.fromJson(e))
              .toList() ??
          [],
      docDTO: DocDTO.fromJson(json['docDTO'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'email': email,
      'firstName': firstName,
      'profilePic': profilePic,
      'surname': surname,
      'medicalDTO': medicalDTO.toJson(),
      'referencesDTOList': referencesDTOList.map((e) => e.toJson()).toList(),
      'docDTO': docDTO.toJson(),
    };
  }
}

/// Medical DTO model for registration
class MedicalDTO {
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

  MedicalDTO({
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

  factory MedicalDTO.fromJson(Map<String, dynamic> json) {
    return MedicalDTO(
      abn: json['abn'] ?? '',
      ahpraLicense: json['ahpraLicense'] ?? '',
      ahpraLicenseFlag: json['ahpraLicenseFlag'] ?? false,
      ahpraNumber: json['ahpraNumber'] ?? '',
      medicalDegree: json['medicalDegree'] ?? '',
      resumeFileName: json['resumeFileName'] ?? '',
      resumeFileUrl: json['resumeFileUrl'] ?? '',
      shortWork: json['shortWork'] ?? '',
      skillLevel: json['skillLevel'] ?? '',
      specialties: json['specialties'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'abn': abn,
      'ahpraLicense': ahpraLicense,
      'ahpraLicenseFlag': ahpraLicenseFlag,
      'ahpraNumber': ahpraNumber,
      'medicalDegree': medicalDegree,
      'resumeFileName': resumeFileName,
      'resumeFileUrl': resumeFileUrl,
      'shortWork': shortWork,
      'skillLevel': skillLevel,
      'specialties': specialties,
    };
  }

  /// Get specialties as a list
  List<String> get specialtiesList {
    if (specialties.isEmpty) return [];
    return specialties.split(',').map((e) => e.trim()).toList();
  }

  /// Get skill levels as a list
  List<String> get skillLevelsList {
    if (skillLevel.isEmpty) return [];
    return skillLevel.split(',').map((e) => e.trim()).toList();
  }
}

/// References DTO model for registration
class ReferencesDTO {
  final String email;
  final String fullName;
  final String hospitalCurrent;
  final String mobile;
  final String seniority;
  final int seq;
  final String specialty;

  ReferencesDTO({
    required this.email,
    required this.fullName,
    required this.hospitalCurrent,
    required this.mobile,
    required this.seniority,
    required this.seq,
    required this.specialty,
  });

  factory ReferencesDTO.fromJson(Map<String, dynamic> json) {
    return ReferencesDTO(
      email: json['email'] ?? '',
      fullName: json['fullName'] ?? '',
      hospitalCurrent: json['hospitalCurrent'] ?? '',
      mobile: json['mobile'] ?? '',
      seniority: json['seniority'] ?? '',
      seq: json['seq'] ?? 0,
      specialty: json['specialty'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'fullName': fullName,
      'hospitalCurrent': hospitalCurrent,
      'mobile': mobile,
      'seniority': seniority,
      'seq': seq,
      'specialty': specialty,
    };
  }
}

/// Document DTO model for registration
class DocDTO {
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

  DocDTO({
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

  factory DocDTO.fromJson(Map<String, dynamic> json) {
    return DocDTO(
      approvalForSecondaryEmployment: json['approvalForSecondaryEmployment'] ?? '',
      approvalForSecondaryEmploymentExt: json['approvalForSecondaryEmploymentExt'] ?? '',
      criminalHistoryCheck: json['criminalHistoryCheck'] ?? '',
      criminalHistoryCheckExt: json['criminalHistoryCheckExt'] ?? '',
      medicareCard: json['medicareCard'] ?? '',
      medicareCardExt: json['medicareCardExt'] ?? '',
      otherDocument: json['otherDocument'] ?? '',
      otherDocumentExt: json['otherDocumentExt'] ?? '',
      medicalDegree: json['medicalDegree'] ?? '',
      medicalDegreeExt: json['medicalDegreeExt'] ?? '',
      policeCheck: json['policeCheck'] ?? '',
      policeCheckExt: json['policeCheckExt'] ?? '',
      primaryDocument: json['primaryDocument'] ?? '',
      primaryDocumentExt: json['primaryDocumentExt'] ?? '',
      threeDocument: json['threeDocument'] ?? '',
      threeDocumentExt: json['threeDocumentExt'] ?? '',
      vaccinationCertificate: json['vaccinationCertificate'] ?? '',
      vaccinationCertificateExt: json['vaccinationCertificateExt'] ?? '',
      workVisa: json['workVisa'] ?? '',
      workVisaExt: json['workVisaExt'] ?? '',
      workingWithChildrenCheck: json['workingWithChildrenCheck'] ?? '',
      workingWithChildrenCheckExt: json['workingWithChildrenCheckExt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'approvalForSecondaryEmployment': approvalForSecondaryEmployment,
      'approvalForSecondaryEmploymentExt': approvalForSecondaryEmploymentExt,
      'criminalHistoryCheck': criminalHistoryCheck,
      'criminalHistoryCheckExt': criminalHistoryCheckExt,
      'medicareCard': medicareCard,
      'medicareCardExt': medicareCardExt,
      'otherDocument': otherDocument,
      'otherDocumentExt': otherDocumentExt,
      'medicalDegree': medicalDegree,
      'medicalDegreeExt': medicalDegreeExt,
      'policeCheck': policeCheck,
      'policeCheckExt': policeCheckExt,
      'primaryDocument': primaryDocument,
      'primaryDocumentExt': primaryDocumentExt,
      'threeDocument': threeDocument,
      'threeDocumentExt': threeDocumentExt,
      'vaccinationCertificate': vaccinationCertificate,
      'vaccinationCertificateExt': vaccinationCertificateExt,
      'workVisa': workVisa,
      'workVisaExt': workVisaExt,
      'workingWithChildrenCheck': workingWithChildrenCheck,
      'workingWithChildrenCheckExt': workingWithChildrenCheckExt,
    };
  }
}
