import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/theme/pin_theme.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpTexFormField extends StatelessWidget {
  final int? length;
  final String? Function(String?)? validator;
  final void Function(String)? onCompleted;
  final Function(String)? onChanged;
  const OtpTexFormField({this.onCompleted, this.onChanged, this.length, this.validator, super.key});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length:length ?? 4,
      cursorColor: Theme.of(context).primaryColor,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      enablePinAutofill: true,
      autoDisposeControllers: true,
      autoUnfocus: true,
      textStyle: TextStyles.textViewBold22,
      mainAxisAlignment: MainAxisAlignment.center,
      useHapticFeedback: true,
      animationType: AnimationType.scale,
      validator: validator,
      pinTheme: FormFieldTheme.pinTheme(context),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      onCompleted: onCompleted,
      onChanged: onChanged,
      backgroundColor: AppColors.transparent,
    );
  }
}
