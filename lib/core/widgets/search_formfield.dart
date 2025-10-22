import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class SearchFormField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  final String hintText;
  final String? label;
  final Color? color;

  const SearchFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.color,
    this.label,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: controller,
      onChanged: onChanged,
      prefixIcon: AppIcons.search,
      hintText: hintText,
      label: label,
      alignLabelWithHint: false,
      cardColor: color ?? AppColors.cardColorLight.withValues(alpha: 0.25),
      style: TextStyles.textViewMedium14.copyWith(color: AppColors.cardColorLight),
      hintStyle: TextStyles.textViewMedium13.copyWith(color: AppColors.cardColorLight),
      prefixColor: AppColors.cardColorLight,
      border: OutlineInputBorder(borderSide: BorderSide(color: AppColors.cardColorLight.withValues(alpha: 0.5)), borderRadius: BorderRadius.circular(100.r)),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.cardColorLight.withValues(alpha: 0.5)), borderRadius: BorderRadius.circular(100.r)),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.cardColorLight), borderRadius: BorderRadius.circular(100.r)),
      disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.cardColorLight.withValues(alpha: 0.5)), borderRadius: BorderRadius.circular(100.r)),
      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.red), borderRadius: BorderRadius.circular(100.r)),
      focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.red), borderRadius: BorderRadius.circular(100.r)),
    );
  }
}
