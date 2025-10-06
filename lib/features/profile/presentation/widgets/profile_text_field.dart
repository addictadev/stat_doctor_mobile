import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:stat_doctor/core/theme/app_colors.dart';
import 'package:stat_doctor/core/utils/styles/styles.dart';
import 'package:stat_doctor/core/utils/responsive_utils.dart';

class ProfileTextField extends StatelessWidget {
  final String label;
  final String value;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool isMultiLine;
  final int? maxLines;
  final String? hintText;
  final bool isOptional;

  const ProfileTextField({
    super.key,
    required this.label,
    required this.value,
    this.onChanged,
    this.keyboardType,
    this.inputFormatters,
    this.isMultiLine = false,
    this.maxLines,
    this.hintText,
    this.isOptional = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label with optional indicator
        Row(
          children: [
            Text(
              label,
              style: TextStyles.textViewMedium16.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (isOptional) ...[
              SizedBox(width: 1.w),
              Text(
                '(optional)',
                style: TextStyles.textViewRegular14.copyWith(
                  color: AppColors.textSecondary,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ],
        ),
        
        SizedBox(height: 1.h),
        
        // Text Input Container
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.inputBackground,
            borderRadius: BorderRadius.circular(
              ResponsiveUtils.getResponsiveBorderRadius(context),
            ),
            border: Border.all(
              color: AppColors.borderLight.withOpacity(0.3),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowLight,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: TextFormField(
            initialValue: value,
            onChanged: onChanged,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            maxLines: isMultiLine ? (maxLines ?? 5) : 1,
            style: TextStyles.textViewRegular16.copyWith(
              color: AppColors.textPrimary,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyles.textViewRegular16.copyWith(
                color: AppColors.textSecondary,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: ResponsiveUtils.getResponsivePadding(context),
                vertical: 2.h,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
