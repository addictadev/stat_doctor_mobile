import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/injection/injection_container.dart';
import 'package:stat_doctor/core/navigation/app_navigator.dart';
import 'package:stat_doctor/core/toast/app_toast.dart';
import 'package:stat_doctor/core/widgets/app_button.dart';
import 'package:stat_doctor/core/widgets/custom_loading.dart';
import 'package:stat_doctor/features/auth/presenation/cubit/auth_cubit.dart';
import 'package:stat_doctor/features/auth/presenation/widgets/document_info.dart';
import 'package:stat_doctor/features/auth/presenation/widgets/document_points.dart';
import 'package:stat_doctor/features/auth/presenation/widgets/other_document.dart';
import 'package:stat_doctor/features/auth/presenation/widgets/primary_document.dart';
import 'package:stat_doctor/features/layout/layout_inj.dart';
import 'package:stat_doctor/features/layout/presentation/screen/layout_screen.dart';
import 'package:stat_doctor/features/options/data/model/options.dart';
import 'package:stat_doctor/features/upload_file/model/upload_file.dart';

class DocumentationScreen extends StatefulWidget {
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

  @override
  State<DocumentationScreen> createState() => _DocumentationScreenState();
}

class _DocumentationScreenState extends State<DocumentationScreen> {
  bool _hasValidDocuments() {
   bool isValid = widget.medicalDegreeFile.value != null && widget.policeCheckFile.value != null && widget.medicalIndemnityInsuranceFile.value != null && widget.workingWithChildrenCheckFile.value != null && widget.vaccinationCertificateFile.value != null && widget.medicareCardFile.value != null;
   return isValid;
  }

  bool _hasValidOtherDocuments() {
    if(widget.uploadOtherDocument.value) {
      return widget.primaryDocumentFile.value != null && widget.otherDocumentFile.value != null;
    }
    return widget.primaryDocumentFile.value != null;
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
            uploadOtherDocument: widget.uploadOtherDocument,
            primaryDocument: widget.primaryDocument,
            otherDocument: widget.otherDocument,
            primaryDocumentFile: widget.primaryDocumentFile,
            otherDocumentFile: widget.otherDocumentFile,
          ),
          DocumentPoints(
            primaryDocumentFile: widget.primaryDocumentFile,
            otherDocumentFile: widget.otherDocumentFile,
          ),
          OtherDocument(
            medicalDegreeFile: widget.medicalDegreeFile,
            policeCheckFile: widget.policeCheckFile,
            workVisaFile: widget.workVisaFile,
            medicalIndemnityInsuranceFile: widget.medicalIndemnityInsuranceFile,
            workingWithChildrenCheckFile: widget.workingWithChildrenCheckFile,
            vaccinationCertificateFile: widget.vaccinationCertificateFile,
            medicareCardFile: widget.medicareCardFile,
            approvalForSecondaryEmploymentFile: widget.approvalForSecondaryEmploymentFile,
          ),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if(state is RegisterSuccess) {
                if(!state.user.registerFlag) {
                  sl<AppNavigator>().pushAndRemoveUntil(screen: MultiBlocProvider(providers: appLayoutBlocs(context), child: LayoutScreen(),));
                }
              } else if(state is RegisterFailure) {
                appToast(context: context, type: ToastType.error, message: state.message);
              }
            },
            builder: (context, state) {
              if(state is RegisterLoading) {return const CustomLoading();}
              return Column(
                spacing: 10.h,
                children: [
                  AppButton(
                    onTap: () {
                      if(_hasValidDocuments() && _hasValidOtherDocuments()) {
                        widget.onNext();
                      }
                       else if(!_hasValidDocuments()) {
                        appToast(context: context, type: ToastType.error, message: 'Please upload all documents');
                      } else if(!_hasValidOtherDocuments()) {
                        appToast(context: context, type: ToastType.error, message: 'Please upload all other documents');
                      }
                    },
                    text: 'Finish',
                  ),
                  AppButton(
                    onTap: () {
                      setState(() {
                        widget.uploadOtherDocument.value = false;
                        widget.primaryDocument.value = null;
                        widget.otherDocument.value = null;
                        widget.primaryDocumentFile.value = null;
                        widget.otherDocumentFile.value = null;
                        widget.medicalDegreeFile.value = null;
                        widget.policeCheckFile.value = null;
                        widget.workVisaFile.value = null;
                        widget.medicalIndemnityInsuranceFile.value = null;
                        widget.workingWithChildrenCheckFile.value = null;
                        widget.vaccinationCertificateFile.value = null;
                        widget.medicareCardFile.value = null;
                        widget.approvalForSecondaryEmploymentFile.value = null;
                      });
                      widget.onNext();
                    },
                    color: Theme.of(context).colorScheme.secondary,
                    textColor: Theme.of(context).colorScheme.onSurface,
                    text: 'Skip',
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}