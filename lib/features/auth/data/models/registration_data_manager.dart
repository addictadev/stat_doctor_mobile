import 'registration_request_model.dart';

/// Manager class to collect and organize registration data from all steps
class RegistrationDataManager {
  // Personal Info Step Data
  String? firstName;
  String? surname;
  String? email;
  String? profilePic;
  String? code;

  // Medical Info Step Data
  String? abn;
  String? ahpraLicense;
  bool? ahpraLicenseFlag;
  String? ahpraNumber;
  String? medicalDegree;
  String? resumeFileName;
  String? resumeFileUrl;
  String? shortWork;
  String? skillLevel;
  String? specialties;

  // References Step Data
  List<ReferenceStepData> references = [];

  // Documents Step Data
  String? approvalForSecondaryEmployment;
  String? approvalForSecondaryEmploymentExt;
  String? criminalHistoryCheck;
  String? criminalHistoryCheckExt;
  String? medicareCard;
  String? medicareCardExt;
  String? otherDocument;
  String? otherDocumentExt;
  String? medicalDegreeDoc;
  String? medicalDegreeDocExt;
  String? policeCheck;
  String? policeCheckExt;
  String? primaryDocument;
  String? primaryDocumentExt;
  String? threeDocument;
  String? threeDocumentExt;
  String? vaccinationCertificate;
  String? vaccinationCertificateExt;
  String? workVisa;
  String? workVisaExt;
  String? workingWithChildrenCheck;
  String? workingWithChildrenCheckExt;

  /// Set personal information
  void setPersonalInfo({
    required String firstName,
    required String surname,
    required String email,
    String? profilePic,
    String? code,
  }) {
    this.firstName = firstName;
    this.surname = surname;
    this.email = email;
    this.profilePic = profilePic;
    this.code = code ?? '0000';
  }

  /// Set medical information
  void setMedicalInfo({
    required String abn,
    required String ahpraNumber,
    String? ahpraLicense,
    bool? ahpraLicenseFlag,
    String? medicalDegree,
    String? resumeFileName,
    String? resumeFileUrl,
    String? shortWork,
    String? skillLevel,
    String? specialties,
  }) {
    this.abn = abn;
    this.ahpraNumber = ahpraNumber;
    this.ahpraLicense = ahpraLicense ?? '';
    this.ahpraLicenseFlag = ahpraLicenseFlag ?? false;
    this.medicalDegree = medicalDegree ?? '';
    this.resumeFileName = resumeFileName ?? '';
    this.resumeFileUrl = resumeFileUrl ?? '';
    this.shortWork = shortWork ?? '';
    this.skillLevel = skillLevel ?? '';
    this.specialties = specialties ?? '';
  }

  /// Add reference
  void addReference(ReferenceStepData reference) {
    references.add(reference);
  }

  /// Set documents information
  void setDocumentsInfo({
    String? approvalForSecondaryEmployment,
    String? approvalForSecondaryEmploymentExt,
    String? criminalHistoryCheck,
    String? criminalHistoryCheckExt,
    String? medicareCard,
    String? medicareCardExt,
    String? otherDocument,
    String? otherDocumentExt,
    String? medicalDegreeDoc,
    String? medicalDegreeDocExt,
    String? policeCheck,
    String? policeCheckExt,
    String? primaryDocument,
    String? primaryDocumentExt,
    String? threeDocument,
    String? threeDocumentExt,
    String? vaccinationCertificate,
    String? vaccinationCertificateExt,
    String? workVisa,
    String? workVisaExt,
    String? workingWithChildrenCheck,
    String? workingWithChildrenCheckExt,
  }) {
    this.approvalForSecondaryEmployment = approvalForSecondaryEmployment ?? '';
    this.approvalForSecondaryEmploymentExt = approvalForSecondaryEmploymentExt ?? '';
    this.criminalHistoryCheck = criminalHistoryCheck ?? '';
    this.criminalHistoryCheckExt = criminalHistoryCheckExt ?? '';
    this.medicareCard = medicareCard ?? '';
    this.medicareCardExt = medicareCardExt ?? '';
    this.otherDocument = otherDocument ?? '';
    this.otherDocumentExt = otherDocumentExt ?? '';
    this.medicalDegreeDoc = medicalDegreeDoc ?? '';
    this.medicalDegreeDocExt = medicalDegreeDocExt ?? '';
    this.policeCheck = policeCheck ?? '';
    this.policeCheckExt = policeCheckExt ?? '';
    this.primaryDocument = primaryDocument ?? '';
    this.primaryDocumentExt = primaryDocumentExt ?? '';
    this.threeDocument = threeDocument ?? '';
    this.threeDocumentExt = threeDocumentExt ?? '';
    this.vaccinationCertificate = vaccinationCertificate ?? '';
    this.vaccinationCertificateExt = vaccinationCertificateExt ?? '';
    this.workVisa = workVisa ?? '';
    this.workVisaExt = workVisaExt ?? '';
    this.workingWithChildrenCheck = workingWithChildrenCheck ?? '';
    this.workingWithChildrenCheckExt = workingWithChildrenCheckExt ?? '';
  }

  /// Check if all required data is collected
  bool get isComplete {
    return firstName != null &&
        surname != null &&
        email != null &&
        abn != null &&
        ahpraNumber != null;
  }

  /// Get missing fields
  List<String> get missingFields {
    List<String> missing = [];
    if (firstName == null) missing.add('First Name');
    if (surname == null) missing.add('Surname');
    if (email == null) missing.add('Email');
    if (abn == null) missing.add('ABN');
    if (ahpraNumber == null) missing.add('AHPRA Number');
    return missing;
  }

  /// Build the complete registration request
  RegistrationRequestModel buildRegistrationRequest() {
    if (!isComplete) {
      throw Exception('Registration data is incomplete. Missing: ${missingFields.join(', ')}');
    }

    return RegistrationRequestModel(
      code: code ?? '0000',
      email: email!,
      firstName: firstName!,
      profilePic: profilePic ?? '',
      surname: surname!,
      medicalDTO: MedicalDTO(
        abn: abn!,
        ahpraLicense: ahpraLicense ?? '',
        ahpraLicenseFlag: ahpraLicenseFlag ?? false,
        ahpraNumber: ahpraNumber!,
        medicalDegree: medicalDegree ?? '',
        resumeFileName: resumeFileName ?? '',
        resumeFileUrl: resumeFileUrl ?? '',
        shortWork: shortWork ?? '',
        skillLevel: skillLevel ?? '',
        specialties: specialties ?? '',
      ),
      referencesDTOList: references.map((ref) => ReferencesDTO(
        email: ref.email,
        fullName: ref.fullName,
        hospitalCurrent: ref.hospitalCurrent,
        mobile: ref.mobile,
        seniority: ref.seniority,
        seq: ref.seq,
        specialty: ref.specialty,
      )).toList(),
      docDTO: DocDTO(
        approvalForSecondaryEmployment: approvalForSecondaryEmployment ?? '',
        approvalForSecondaryEmploymentExt: approvalForSecondaryEmploymentExt ?? '',
        criminalHistoryCheck: criminalHistoryCheck ?? '',
        criminalHistoryCheckExt: criminalHistoryCheckExt ?? '',
        medicareCard: medicareCard ?? '',
        medicareCardExt: medicareCardExt ?? '',
        otherDocument: otherDocument ?? '',
        otherDocumentExt: otherDocumentExt ?? '',
        medicalDegree: medicalDegreeDoc ?? '',
        medicalDegreeExt: medicalDegreeDocExt ?? '',
        policeCheck: policeCheck ?? '',
        policeCheckExt: policeCheckExt ?? '',
        primaryDocument: primaryDocument ?? '',
        primaryDocumentExt: primaryDocumentExt ?? '',
        threeDocument: threeDocument ?? '',
        threeDocumentExt: threeDocumentExt ?? '',
        vaccinationCertificate: vaccinationCertificate ?? '',
        vaccinationCertificateExt: vaccinationCertificateExt ?? '',
        workVisa: workVisa ?? '',
        workVisaExt: workVisaExt ?? '',
        workingWithChildrenCheck: workingWithChildrenCheck ?? '',
        workingWithChildrenCheckExt: workingWithChildrenCheckExt ?? '',
      ),
    );
  }

  /// Clear all data
  void clear() {
    firstName = null;
    surname = null;
    email = null;
    profilePic = null;
    code = null;
    abn = null;
    ahpraLicense = null;
    ahpraLicenseFlag = null;
    ahpraNumber = null;
    medicalDegree = null;
    resumeFileName = null;
    resumeFileUrl = null;
    shortWork = null;
    skillLevel = null;
    specialties = null;
    references.clear();
    approvalForSecondaryEmployment = null;
    approvalForSecondaryEmploymentExt = null;
    criminalHistoryCheck = null;
    criminalHistoryCheckExt = null;
    medicareCard = null;
    medicareCardExt = null;
    otherDocument = null;
    otherDocumentExt = null;
    medicalDegreeDoc = null;
    medicalDegreeDocExt = null;
    policeCheck = null;
    policeCheckExt = null;
    primaryDocument = null;
    primaryDocumentExt = null;
    threeDocument = null;
    threeDocumentExt = null;
    vaccinationCertificate = null;
    vaccinationCertificateExt = null;
    workVisa = null;
    workVisaExt = null;
    workingWithChildrenCheck = null;
    workingWithChildrenCheckExt = null;
  }
}

/// Data class for reference information from registration steps
class ReferenceStepData {
  final String fullName;
  final String email;
  final String mobile;
  final String hospitalCurrent;
  final String seniority;
  final String specialty;
  final int seq;

  ReferenceStepData({
    required this.fullName,
    required this.email,
    required this.mobile,
    required this.hospitalCurrent,
    required this.seniority,
    required this.specialty,
    required this.seq,
  });
}
