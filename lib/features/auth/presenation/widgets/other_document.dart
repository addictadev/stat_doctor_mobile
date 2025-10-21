import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/align_text.dart';
import 'package:stat_doctor/features/upload_file/model/upload_file.dart';
import 'package:stat_doctor/features/upload_file/presentation/widgets/document_card.dart';

class OtherDocument extends StatelessWidget {
  final ValueNotifier<UploadFile?> medicalDegreeFile;
  final ValueNotifier<UploadFile?> policeCheckFile;
  final ValueNotifier<UploadFile?> workVisaFile;
  final ValueNotifier<UploadFile?> medicalIndemnityInsuranceFile;
  final ValueNotifier<UploadFile?> workingWithChildrenCheckFile;
  final ValueNotifier<UploadFile?> vaccinationCertificateFile;
  final ValueNotifier<UploadFile?> medicareCardFile;
  final ValueNotifier<UploadFile?> approvalForSecondaryEmploymentFile;

  const OtherDocument({
    required this.medicalDegreeFile,
    required this.policeCheckFile,
    required this.workVisaFile,
    required this.medicalIndemnityInsuranceFile,
    required this.workingWithChildrenCheckFile,
    required this.vaccinationCertificateFile,
    required this.medicareCardFile,
    required this.approvalForSecondaryEmploymentFile,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          spacing: 10.w,
          children: [
            Expanded(child: Text("Other documentation", style: TextStyles.textViewMedium16)),
            AppIcons.icon(icon: AppIcons.info, color: Theme.of(context).hintColor, size: 14),
          ],
        ),

        AlignText(
          text: "Medical degree",
          style: TextStyles.textViewMedium14,
          padding: EdgeInsetsDirectional.only(start: 5.w, top: 15.h, bottom: 5.h),
        ),
        DocumentCard(documentFile: medicalDegreeFile),


        AlignText(
          text: "Police check",
          style: TextStyles.textViewMedium14,
          padding: EdgeInsetsDirectional.only(start: 5.w, top: 15.h, bottom: 5.h),
        ),
        DocumentCard(documentFile: policeCheckFile),


        AlignText(
          text: "Work visa (if applicable)",
          style: TextStyles.textViewMedium14,
          padding: EdgeInsetsDirectional.only(start: 5.w, top: 15.h, bottom: 5.h),
        ),
        DocumentCard(documentFile: workVisaFile),

        AlignText(
          text: "Medical indemnity insurance",
          style: TextStyles.textViewMedium14,
          padding: EdgeInsetsDirectional.only(start: 5.w, top: 15.h, bottom: 5.h),
        ),
        DocumentCard(documentFile: medicalIndemnityInsuranceFile),

        AlignText(  
          text: "Working with children check (need a new one for each state you work in)",
          style: TextStyles.textViewMedium14,
          padding: EdgeInsetsDirectional.only(start: 5.w, top: 15.h, bottom: 5.h),
        ),
        DocumentCard(documentFile: workingWithChildrenCheckFile),

        AlignText(  
          text: "Vaccination certificate",
          style: TextStyles.textViewMedium14,
          padding: EdgeInsetsDirectional.only(start: 5.w, top: 15.h, bottom: 5.h),
        ),
        DocumentCard(documentFile: vaccinationCertificateFile),

        AlignText(  
          text: "Medicare card",
          style: TextStyles.textViewMedium14,
          padding: EdgeInsetsDirectional.only(start: 5.w, top: 15.h, bottom: 5.h),
        ),
        DocumentCard(documentFile: medicareCardFile),

        AlignText(  
          text: "Approval for secondary employment (if applicable)",
          style: TextStyles.textViewMedium14,
          padding: EdgeInsetsDirectional.only(start: 5.w, top: 15.h, bottom: 5.h),
        ),
        DocumentCard(documentFile: approvalForSecondaryEmploymentFile),
      ],
    );
  }
}