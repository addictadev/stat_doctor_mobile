import 'package:stat_doctor/core/widgets/app_text_form_field.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabeledFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final bool onlyDigit;
  final String? hintText;
  final String? suffixIcon;
  final String? prefixIcon;
  final Widget? suffix;
  final Widget? prefix;
  final Widget? suffixWidget;
  final bool? alignLabelWithHint;
  final Widget? prefixWidget;
  final int? maxLength;
  final bool readOnly;
  final Color? cardColor;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? contentPadding;
  final Function()? onTap;
  final void Function()? onSuffixPressed;
  final void Function(String)? onChanged;
  final bool? obscureText;
  final TextStyle? hintStyle;
  final int? minLines;
  final InputBorder? border;
  final InputBorder? errorBorder;
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? disabledBorder;
  final InputBorder? enabledBorder;
  final TextStyle? labelStyle;
  final double spacing;

  const LabeledFormField({
    super.key,
    required this.label,
    required this.controller,
    this.validator,
    this.autovalidateMode,
    this.onlyDigit = false,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.suffix,
    this.prefix,
    this.suffixWidget,
    this.alignLabelWithHint,
    this.prefixWidget,
    this.maxLength,
    this.readOnly = false,
    this.cardColor,
    this.keyboardType,
    this.contentPadding,
    this.onTap,
    this.onSuffixPressed,
    this.onChanged,
    this.obscureText,
    this.hintStyle,
    this.minLines,
    this.border,
    this.errorBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.disabledBorder,
    this.enabledBorder,
    this.labelStyle,
    this.spacing = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: labelStyle ?? TextStyles.textViewRegular12),
        SizedBox(height: spacing.h),
        AppTextFormField(
          controller: controller,
          validator: validator,
          autovalidateMode: autovalidateMode,
          onlyDigit: onlyDigit,
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          suffix: suffix,
          prefix: prefix,
          suffixWidget: suffixWidget,
          alignLabelWithHint: alignLabelWithHint,
          prefixWidget: prefixWidget,
          maxLength: maxLength,
          readOnly: readOnly,
          cardColor: cardColor,
          keyboardType: keyboardType,
          contentPadding: contentPadding,
          onTap: onTap,
          onSuffixPressed: onSuffixPressed,
          onChanged: onChanged,
          obscureText: obscureText,
          hintStyle: hintStyle,
          minLines: minLines,
          border: border,
          errorBorder: errorBorder,
          focusedBorder: focusedBorder,
          focusedErrorBorder: focusedErrorBorder,
          disabledBorder: disabledBorder,
          enabledBorder: enabledBorder,
          label: null,
        ),
      ],
    );
  }
}
