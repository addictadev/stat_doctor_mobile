import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/utils/validator.dart';
import 'package:stat_doctor/core/widgets/app_text_form_field.dart';

class PersonalInfoFields extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailAddressController;
  final GlobalKey<FormState> formKey;
  
  const PersonalInfoFields({
    required this.firstNameController,
    required this.lastNameController,
    required this.emailAddressController,
    required this.formKey,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        spacing: 15.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextFormField(
            controller: firstNameController,
            hintText: 'First Name',
            label: 'First Name',
            validator: (value) => Validator.defaultValidator(value),
          ),
          AppTextFormField(
            controller: lastNameController,
            hintText: 'Last Name',
            label: 'Last Name',
            validator: (value) => Validator.defaultValidator(value),
          ),
          AppTextFormField(
            controller: emailAddressController,
            hintText: 'Email Address',
            label: 'Email Address',
            validator: (value) => Validator.email(value),
            keyboardType: TextInputType.emailAddress,
          ),
        ],
      ),
    );
  }
}