import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../utils/responsive_utils.dart';

class CustomDropdownField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? value;
  final List<DropdownMenuItem<String>> items;
  final ValueChanged<String?>? onChanged;
  final String? Function(String?)? validator;
  final bool enabled;
  final Widget? suffixIcon;

  const CustomDropdownField({
    super.key,
    this.label,
    this.hint,
    this.value,
    required this.items,
    this.onChanged,
    this.validator,
    this.enabled = true,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final isRTL = Directionality.of(context) == TextDirection.rtl;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Padding(
            padding: EdgeInsets.only(
              bottom: 8,
              right: isRTL ? 4 : 0,
              left: isRTL ? 0 : 4,
            ),
            child: Text(
              label!,
              style: ResponsiveUtils.getResponsiveTextStyle(
                context,
                fontSize: ResponsiveUtils.getResponsiveFontSize(
                  context,
                  mobile: 14,
                  tablet: 16,
                  desktop: 18,
                ),
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: AppColors.borderLight, width: 1),
          ),
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
              hintText: hint,
              hintStyle: ResponsiveUtils.getResponsiveTextStyle(
                context,
                fontSize: ResponsiveUtils.getResponsiveFontSize(
                  context,
                  mobile: 14,
                  tablet: 16,
                  desktop: 18,
                ),
                color: AppColors.textTertiary,
              ),
            ),
            items: items,
            onChanged: onChanged,
            validator: validator,
            dropdownColor: AppColors.white,
            style: ResponsiveUtils.getResponsiveTextStyle(
              context,
              fontSize: ResponsiveUtils.getResponsiveFontSize(
                context,
                mobile: 14,
                tablet: 16,
                desktop: 18,
              ),
              color: AppColors.textPrimary,
            ),
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.primary,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
