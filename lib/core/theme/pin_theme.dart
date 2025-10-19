import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class FormFieldTheme {
  static PinTheme pinTheme(BuildContext context) => PinTheme(
    shape: PinCodeFieldShape.box,
    borderRadius: BorderRadius.circular(15.r),
    fieldOuterPadding: EdgeInsets.symmetric(horizontal: 5.w),
    fieldHeight: 70.h,
    fieldWidth: 70.w,
    borderWidth: 1,
    activeColor: Theme.of(context).primaryColor,
    selectedColor: Theme.of(context).dividerColor,
    inactiveColor: Theme.of(context).dividerColor,
    activeFillColor: Theme.of(context).cardColor,
    selectedFillColor: Theme.of(context).cardColor,
    inactiveFillColor: Theme.of(context).cardColor,
  );
}