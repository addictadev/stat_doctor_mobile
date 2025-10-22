import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/toast/app_toast.dart';
import 'package:stat_doctor/core/utils/validator.dart';
import 'package:stat_doctor/core/widgets/align_text.dart';
import 'package:stat_doctor/core/widgets/app_button.dart';
import 'package:stat_doctor/core/widgets/app_text_form_field.dart';
import 'package:stat_doctor/features/auth/presenation/widgets/have_restictions.dart';
import 'package:stat_doctor/features/auth/presenation/widgets/medical_dropdowns.dart';
import 'package:stat_doctor/features/options/data/model/options.dart';
import 'package:stat_doctor/features/upload_file/model/upload_file.dart';
import 'package:stat_doctor/features/upload_file/presentation/widgets/document_card.dart';

class MedicalInfoScreen extends StatelessWidget {
  final ValueNotifier<Options?> medicalDegree;
  final ValueNotifier<Options?> skillLevel;
  final ValueNotifier<Options?> specialties;
  final ValueNotifier<bool> haveRestrictions;
  final TextEditingController abnController;
  final TextEditingController workBioController;
  final ValueNotifier<UploadFile?> cvFile;
  final VoidCallback onNext;

  const MedicalInfoScreen({
    required this.medicalDegree,
    required this.skillLevel,
    required this.specialties,
    required this.haveRestrictions,
    required this.abnController,
    required this.workBioController,
    required this.cvFile,
    required this.onNext,
    super.key,
  });

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 25.h),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MedicalDropdowns(
              medicalDegree: medicalDegree,
              skillLevel: skillLevel,
              specialties: specialties,
            ),
            HaveRestictions(haveRestrictions: haveRestrictions),
            AlignText(
              text: "Enter your ABN (optional)",
              style: TextStyles.textViewMedium14,
              padding: EdgeInsetsDirectional.only(start: 5.w, top: 15.h, bottom: 5.h),
            ),
            AppTextFormField(
              controller: abnController,
              hintText: '12345678901',
              keyboardType: TextInputType.number,
            ),
            AlignText(
              text: "Write a short work bio about yourself",
              style: TextStyles.textViewMedium14,
              padding: EdgeInsetsDirectional.only(start: 5.w, top: 15.h, bottom: 5.h),
            ),
            AppTextFormField(
              controller: workBioController,
              hintText: 'Type...',
              keyboardType: TextInputType.multiline,
              maxLength: 850,
              validator: (value) => Validator.defaultValidator(value),
              minLines: 5,
            ),
            AlignText(
              text: "CV / Resume",
              style: TextStyles.textViewMedium14,
              padding: EdgeInsetsDirectional.only(start: 5.w, top: 15.h, bottom: 5.h),
            ),
            DocumentCard(documentFile: cvFile),
            AppButton(
              onTap: () {
                if (formKey.currentState!.validate() && cvFile.value != null) {onNext();}
                else if(cvFile.value == null) {appToast(context: context, type: ToastType.error, message: 'Please upload your CV / Resume');}
              },
              margin: EdgeInsets.only(top: 15.h),
              text: 'Next',
            )
          ],
        ),
      ),
    );
  }
}