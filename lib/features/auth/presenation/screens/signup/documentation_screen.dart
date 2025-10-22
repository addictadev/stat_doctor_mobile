import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/injection/injection_container.dart';
import 'package:stat_doctor/core/navigation/app_navigator.dart';
import 'package:stat_doctor/core/toast/app_toast.dart';
import 'package:stat_doctor/core/widgets/app_button.dart';
import 'package:stat_doctor/core/widgets/custom_loading.dart';
import 'package:stat_doctor/features/auth/presenation/cubit/auth_cubit.dart';
import 'package:stat_doctor/features/auth/presenation/screens/login/login_screen.dart';
import 'package:stat_doctor/features/auth/presenation/widgets/document_info.dart';
import 'package:stat_doctor/features/auth/presenation/widgets/document_points.dart';
import 'package:stat_doctor/features/auth/presenation/widgets/other_document.dart';
import 'package:stat_doctor/features/auth/presenation/widgets/primary_document.dart';
import 'package:stat_doctor/features/options/data/model/options.dart';
import 'package:stat_doctor/features/upload_file/model/upload_file.dart';

class DocumentationScreen extends StatelessWidget {
  final ValueNotifier<bool> uploadOtherDocument;
  final ValueNotifier<Options?> primaryDocument;
  final ValueNotifier<Options?> otherDocument;
  final ValueNotifier<UploadFile?> primaryDocumentFile;
  final ValueNotifier<UploadFile?> otherDocumentFile;
  final ValueNotifier<UploadFile?> medicalDegreeFile;
  final ValueNotifier<UploadFile?> policeCheckFile;
  final ValueNotifier<UploadFile?> workVisaFile;
  final ValueNotifier<UploadFile?> medicalIndemnityInsuranceFile;
  final ValueNotifier<UploadFile?> workingWithChildrenCheckFile;
  final ValueNotifier<UploadFile?> vaccinationCertificateFile;
  final ValueNotifier<UploadFile?> medicareCardFile;
  final ValueNotifier<UploadFile?> approvalForSecondaryEmploymentFile;
  final VoidCallback onNext;

  const DocumentationScreen({
    required this.uploadOtherDocument,
    required this.primaryDocument,
    required this.otherDocument,
    required this.primaryDocumentFile,
    required this.otherDocumentFile,
    required this.medicalDegreeFile,
    required this.policeCheckFile,
    required this.workVisaFile,
    required this.medicalIndemnityInsuranceFile,
    required this.workingWithChildrenCheckFile,
    required this.vaccinationCertificateFile,
    required this.medicareCardFile,
    required this.approvalForSecondaryEmploymentFile,
    required this.onNext,
    super.key,
  });

  bool _hasValidDocuments() {
   bool isValid = medicalDegreeFile.value != null && policeCheckFile.value != null && medicalIndemnityInsuranceFile.value != null && workingWithChildrenCheckFile.value != null && vaccinationCertificateFile.value != null && medicareCardFile.value != null;
   return isValid;
  }

  bool _hasValidOtherDocuments() {
    if(uploadOtherDocument.value) {
      return primaryDocumentFile.value != null && otherDocumentFile.value != null;
    }
    return primaryDocumentFile.value != null;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 15.h,
        children: [
          DocumentInfo(),
          PrimaryDocument(
            uploadOtherDocument: uploadOtherDocument,
            primaryDocument: primaryDocument,
            otherDocument: otherDocument,
            primaryDocumentFile: primaryDocumentFile,
            otherDocumentFile: otherDocumentFile,
          ),
          DocumentPoints(
            primaryDocumentFile: primaryDocumentFile,
            otherDocumentFile: otherDocumentFile,
          ),
          OtherDocument(
            medicalDegreeFile: medicalDegreeFile,
            policeCheckFile: policeCheckFile,
            workVisaFile: workVisaFile,
            medicalIndemnityInsuranceFile: medicalIndemnityInsuranceFile,
            workingWithChildrenCheckFile: workingWithChildrenCheckFile,
            vaccinationCertificateFile: vaccinationCertificateFile,
            medicareCardFile: medicareCardFile,
            approvalForSecondaryEmploymentFile: approvalForSecondaryEmploymentFile,
          ),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if(state is RegisterSuccess) {
                appToast(context: context, type: ToastType.success, message: state.message);
                sl<AppNavigator>().pushAndRemoveUntil(screen: BlocProvider(
                  create: (context) => sl<AuthCubit>(),
                  child: LoginScreen(),
                ));
              } else if(state is RegisterFailure) {
                appToast(context: context, type: ToastType.error, message: state.message);
              }
            },
            builder: (context, state) {
              if(state is RegisterLoading) {return const CustomLoading();}
              return AppButton(
                onTap: () {
                  if(_hasValidDocuments() && _hasValidOtherDocuments()) {
                    onNext();
                  }
                   else if(!_hasValidDocuments()) {
                    appToast(context: context, type: ToastType.error, message: 'Please upload all documents');
                  } else if(!_hasValidOtherDocuments()) {
                    appToast(context: context, type: ToastType.error, message: 'Please upload all other documents');
                  }
                },
                text: 'Finish',
              );
            },
          )
        ],
      ),
    );
  }
}