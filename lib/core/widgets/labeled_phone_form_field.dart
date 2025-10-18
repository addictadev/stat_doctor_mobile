import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/textformfield_phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabeledPhoneFormField extends StatelessWidget {
  final TextEditingController phoneController;
  final TextEditingController countryCodeController;
  final bool enableCountryPicker;
  final String hintText;
  final Color? cardColor;
  final String label;
  final TextStyle? labelStyle;
  final bool? readOnly;
  final String? regionCode;
  final String? Function(String?)? validator;
  final double spacing;

  const LabeledPhoneFormField({
    required this.hintText,
    this.validator,
    required this.label,
    this.labelStyle,
    this.readOnly,
    this.regionCode,
    this.cardColor,
    this.enableCountryPicker = true,
    required this.phoneController,
    required this.countryCodeController,
    super.key,
    this.spacing = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: labelStyle ?? TextStyles.textViewRegular12),
        SizedBox(height: spacing.h),
        TextFormFieldPhone(
          validator: validator,
          readOnly: readOnly,
          cardColor: cardColor,
          label: null,
          hintText: hintText,
          phoneController: phoneController,
          countryCodeController: countryCodeController,
        ),
      ],
    );
  }
}
