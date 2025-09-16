// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';
import 'package:stat_doctor/core/theme/app_colors.dart';

class CustomPinCodeTextField extends StatelessWidget {
  CustomPinCodeTextField(
      {super.key,
      required this.context,
      required this.onChanged,
      this.alignment,
      this.controller,
      this.textStyle,
      this.hintStyle,
      this.validator,
      required this.oncomplete});

  final Alignment? alignment;

  final BuildContext context;

  final TextEditingController? controller;

  final TextStyle? textStyle;

  final TextStyle? hintStyle;

  Function(String) onChanged;
  Function(String) oncomplete;

  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: pinCodeTextFieldWidget,
          )
        : pinCodeTextFieldWidget;
  }

  Widget get pinCodeTextFieldWidget => Padding(
        padding:  EdgeInsets.symmetric(horizontal: 5.w),
        child: PinCodeTextField(
          appContext: context,
          controller: controller,
          length: 4,
          keyboardType: TextInputType.number,
          textStyle: textStyle,
          hintStyle: hintStyle,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          enableActiveFill: true,
          pinTheme: PinTheme(
            fieldHeight: 6.h,
            fieldWidth: 6.h,
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(2.w),
            inactiveColor: AppColors.welcomeBackground,
            activeColor: AppColors.white,
            
            selectedFillColor: AppColors.primary,
            inactiveFillColor: AppColors.white,
            activeFillColor: AppColors.white,
            selectedColor: Colors.grey,
          ),
          onChanged: (value) => onChanged(value),
          onCompleted: (value) => oncomplete(value),
          validator: validator,
        ),
      );
}
