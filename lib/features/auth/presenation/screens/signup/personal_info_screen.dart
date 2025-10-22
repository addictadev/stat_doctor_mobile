import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/toast/app_toast.dart';
import 'package:stat_doctor/core/widgets/app_button.dart';
import 'package:stat_doctor/features/auth/presenation/widgets/login_method.dart';
import 'package:stat_doctor/features/auth/presenation/widgets/personal_info_fields.dart';
import 'package:stat_doctor/features/auth/presenation/widgets/upload_photo.dart';

class PersonalInfoScreen extends StatelessWidget {
  final TextEditingController photoProfileController;
  final TextEditingController photoProfilePathController;
  final TextEditingController photoProfileNameController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController countryCodeController;
  final TextEditingController phoneController;
  final TextEditingController emailAddressController;
  final ValueNotifier<bool> faceIdEnabled;
  final ValueNotifier<bool> touchIdEnabled;
  final VoidCallback onNext;
  
  const PersonalInfoScreen({
    required this.photoProfileController,
    required this.photoProfilePathController,
    required this.photoProfileNameController,
    required this.firstNameController,
    required this.lastNameController,
    required this.countryCodeController,
    required this.phoneController,
    required this.emailAddressController,
    required this.faceIdEnabled,
    required this.touchIdEnabled,
    required this.onNext,
    super.key
  });
  
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 25.h),
      child: Column(
        spacing: 15.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UploadPhoto(
            photoProfileController: photoProfileController,
            photoProfilePathController: photoProfilePathController,
            photoProfileNameController: photoProfileNameController,
          ),
          PersonalInfoFields(
            firstNameController: firstNameController,
            lastNameController: lastNameController,
            countryCodeController: countryCodeController,
            phoneController: phoneController,
            emailAddressController: emailAddressController,
            formKey: formKey,
          ),
          LoginMethod(
            faceIdEnabled: faceIdEnabled,
            touchIdEnabled: touchIdEnabled,
          ),
          AppButton(
            onTap: () {
              if (formKey.currentState!.validate() && photoProfileController.text.isNotEmpty) {onNext();}
              else if(photoProfileController.text.isEmpty) {appToast(context: context, type: ToastType.error, message: 'Please upload your profile picture');}
            },
            text: 'Next',
          ),
        ],
      ),
    );
  }
}