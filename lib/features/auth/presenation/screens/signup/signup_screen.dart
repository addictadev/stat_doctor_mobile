import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/align_text.dart';
import 'package:stat_doctor/features/auth/data/objects_value/register_params.dart';
import 'package:stat_doctor/features/auth/presenation/cubit/auth_cubit.dart';
import 'package:stat_doctor/features/auth/presenation/screens/signup/documentation_screen.dart';
import 'package:stat_doctor/features/auth/presenation/screens/signup/medical_info_screen.dart';
import 'package:stat_doctor/features/auth/presenation/screens/signup/personal_info_screen.dart';
import 'package:stat_doctor/features/auth/presenation/screens/signup/references_screen.dart';
import 'package:stat_doctor/features/auth/presenation/widgets/signup_stepper.dart';
import 'package:flutter/material.dart';
import 'package:stat_doctor/features/options/data/model/options.dart';
import 'package:stat_doctor/features/options/presentation/cubit/options_cubit.dart';
import 'package:stat_doctor/features/upload_file/model/upload_file.dart';

class SignupScreen extends StatefulWidget {
  final String code;
  const SignupScreen({required this.code, super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  int activeStep = 0;
  late List<Widget> screens;

  // ! Personal Info
  TextEditingController photoProfileController = TextEditingController();
  TextEditingController photoProfilePathController = TextEditingController();
  TextEditingController photoProfileNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  ValueNotifier<bool> faceIdEnabled = ValueNotifier(false);
  ValueNotifier<bool> touchIdEnabled = ValueNotifier(false);

  // ! Medical Info
  ValueNotifier<Options?> medicalDegree = ValueNotifier(null);
  ValueNotifier<Options?> skillLevel = ValueNotifier(null);
  ValueNotifier<Options?> specialties = ValueNotifier(null);
  ValueNotifier<bool> haveRestrictions = ValueNotifier(true);
  TextEditingController abnController = TextEditingController();
  TextEditingController workBioController = TextEditingController();
  ValueNotifier<UploadFile?> cvFile = ValueNotifier(null);
  
  // ! References
  List<ReferencesDTO> references = [ReferencesDTO(seq: 0),];

  // ! Documentation
  ValueNotifier<bool> uploadOtherDocument = ValueNotifier(false);
  ValueNotifier<Options?> primaryDocument = ValueNotifier(null);
  ValueNotifier<Options?> otherDocument = ValueNotifier(null);
  ValueNotifier<UploadFile?> primaryDocumentFile = ValueNotifier(null);
  ValueNotifier<UploadFile?> otherDocumentFile = ValueNotifier(null);
  ValueNotifier<UploadFile?> medicalDegreeFile = ValueNotifier(null);
  ValueNotifier<UploadFile?> policeCheckFile = ValueNotifier(null);
  ValueNotifier<UploadFile?> workVisaFile = ValueNotifier(null);
  ValueNotifier<UploadFile?> medicalIndemnityInsuranceFile = ValueNotifier(null);
  ValueNotifier<UploadFile?> workingWithChildrenCheckFile = ValueNotifier(null);
  ValueNotifier<UploadFile?> vaccinationCertificateFile = ValueNotifier(null);
  ValueNotifier<UploadFile?> medicareCardFile = ValueNotifier(null);
  ValueNotifier<UploadFile?> approvalForSecondaryEmploymentFile = ValueNotifier(null);


  bool referencesIsEmpty(List<ReferencesDTO> references) {
    ReferencesDTO reference = references.first;
    return (reference.email == null ||
    reference.fullName == null ||
    reference.hospitalCurrent == null ||
    reference.mobile == null ||
    reference.seniority == null ||
    reference.specialty == null) &&
    (reference.seq == null || reference.seq == 0);
  }


  @override
  void initState() {
    context.read<OptionsCubit>().getAllOptions();

    screens = [
      // ! Personal Info
      PersonalInfoScreen(
        photoProfileController: photoProfileController,
        photoProfilePathController: photoProfilePathController,
        photoProfileNameController: photoProfileNameController,
        firstNameController: firstNameController,
        lastNameController: lastNameController,
        emailAddressController: emailAddressController,
        faceIdEnabled: faceIdEnabled,
        touchIdEnabled: touchIdEnabled,
        onNext: () {setState(() {activeStep++;});},
      ),

      // ! Medical Info
      MedicalInfoScreen(
        medicalDegree: medicalDegree,
        skillLevel: skillLevel,
        specialties: specialties,
        haveRestrictions: haveRestrictions,
        abnController: abnController,
        workBioController: workBioController,
        cvFile: cvFile,
        onNext: () {setState(() {activeStep++;});},
      ),

      // ! References
      ReferencesScreen(
        references: references,
        onNext: () {setState(() {activeStep++;});},
        onSkip: () {setState(() {activeStep++;});},
      ),

      // ! Documentation
      DocumentationScreen(
        uploadOtherDocument: uploadOtherDocument,
        primaryDocument: primaryDocument,
        otherDocument: otherDocument,
        primaryDocumentFile: primaryDocumentFile,
        otherDocumentFile: otherDocumentFile,
        medicalDegreeFile: medicalDegreeFile,
        policeCheckFile: policeCheckFile,
        workVisaFile: workVisaFile,
        medicalIndemnityInsuranceFile: medicalIndemnityInsuranceFile,
        workingWithChildrenCheckFile: workingWithChildrenCheckFile,
        vaccinationCertificateFile: vaccinationCertificateFile,
        medicareCardFile: medicareCardFile,
        approvalForSecondaryEmploymentFile: approvalForSecondaryEmploymentFile,
        onNext: () {
          context.read<AuthCubit>().register(
            params: RegisterParams(
              code: widget.code,
              email: emailAddressController.text,
              firstName: firstNameController.text,
              profilePic: photoProfileController.text,
              surname: lastNameController.text,
              medicalDTO: MedicalDTO(
                abn: abnController.text,
                ahpraLicense: '',
                ahpraLicenseFlag: haveRestrictions.value,
                ahpraNumber: '',
                medicalDegree: medicalDegree.value?.id ?? '',
                resumeFileName: cvFile.value?.name ?? '',
                resumeFileUrl: cvFile.value?.url ?? '',
                shortWork: workBioController.text,
                skillLevel: skillLevel.value?.id ?? '',
                specialties: specialties.value?.id ?? '',
              ),
              referencesDTOList: referencesIsEmpty(references) ? [] : references,
              docDTO: DocDTO(
                approvalForSecondaryEmployment: approvalForSecondaryEmploymentFile.value?.url ?? '',
                approvalForSecondaryEmploymentExt: approvalForSecondaryEmploymentFile.value?.name ?? '',
                criminalHistoryCheck: policeCheckFile.value?.url ?? '',
                criminalHistoryCheckExt: policeCheckFile.value?.name ?? '',
                medicareCard: medicareCardFile.value?.url ?? '',
                medicareCardExt: medicareCardFile.value?.name ?? '',
                otherDocument: otherDocumentFile.value?.url ?? '',
                otherDocumentExt: otherDocumentFile.value?.name ?? '',
                medicalDegree: medicalDegreeFile.value?.url ?? '',
                medicalDegreeExt: medicalDegreeFile.value?.name ?? '',
                policeCheck: policeCheckFile.value?.url ?? '',
                policeCheckExt: policeCheckFile.value?.name ?? '',
                primaryDocument: primaryDocumentFile.value?.url ?? '' ,
                primaryDocumentExt: primaryDocumentFile.value?.name ?? '',
                threeDocument: medicalIndemnityInsuranceFile.value?.url ?? '',
                threeDocumentExt: medicalIndemnityInsuranceFile.value?.name ?? '',
                vaccinationCertificate: vaccinationCertificateFile.value?.url ?? '',
                vaccinationCertificateExt: vaccinationCertificateFile.value?.name ?? '',
                workVisa: workVisaFile.value?.url ?? '',
                workVisaExt: workVisaFile.value?.name ?? '',
                workingWithChildrenCheck: workingWithChildrenCheckFile.value?.url ?? '',
                workingWithChildrenCheckExt: workingWithChildrenCheckFile.value?.name ?? '',
              )
            )
          );
        },
      ),
    ];
    super.initState();
  }

  @override
  void dispose() {
    // ! Personal Info
    photoProfileController.dispose();
    photoProfilePathController.dispose();
    photoProfileNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailAddressController.dispose();
    faceIdEnabled.dispose();
    touchIdEnabled.dispose();

    // ! Medical Info
    medicalDegree.dispose();
    skillLevel.dispose();
    specialties.dispose();
    haveRestrictions.dispose();
    abnController.dispose();
    workBioController.dispose();
    cvFile.dispose();

    // ! References
    references.clear();

    // ! Documentation
    uploadOtherDocument.dispose();
    primaryDocument.dispose();
    otherDocument.dispose();
    primaryDocumentFile.dispose();
    otherDocumentFile.dispose();
    medicalDegreeFile.dispose();
    policeCheckFile.dispose();
    workVisaFile.dispose();
    medicalIndemnityInsuranceFile.dispose();
    workingWithChildrenCheckFile.dispose();
    vaccinationCertificateFile.dispose();
    medicareCardFile.dispose();
    approvalForSecondaryEmploymentFile.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            AlignText(text: "Enter Your Deta to Create Account", style: TextStyles.textViewBold16, padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 10.h, bottom: 5.h),),
            SignupStepper(
              currentStep: activeStep,
              onStepTap: (step) {if (step < activeStep) {setState(() {activeStep = step;});}},
            ),
            Expanded(child: screens[activeStep])
          ],
        ),
      ),
    );
  }
}