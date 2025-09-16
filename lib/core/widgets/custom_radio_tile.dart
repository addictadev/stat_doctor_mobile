import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../utils/responsive_utils.dart';

class CustomRadioTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool isSelected;
  final VoidCallback onTap;
  final Widget? leading;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;

  const CustomRadioTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.isSelected,
    required this.onTap,
    this.leading,
    this.selectedColor,
    this.unselectedColor,
    this.textColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ?? EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? (selectedColor ?? AppColors.primary)
              : (unselectedColor ?? AppColors.white),
          borderRadius: BorderRadius.circular(
            ResponsiveUtils.getResponsiveBorderRadius(context),
          ),
          border: Border.all(
            color: isSelected
                ? (selectedColor ?? AppColors.primary)
                : AppColors.borderLight,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            if (leading != null) ...[
              leading!,
              SizedBox(width: 12),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: ResponsiveUtils.getResponsiveTextStyle(
                      context,
                      fontSize: ResponsiveUtils.getResponsiveFontSize(
                        context,
                        mobile: 14,
                        tablet: 16,
                        desktop: 18,
                      ),
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? AppColors.white
                          : (textColor ?? AppColors.textPrimary),
                    ),
                  ),
                  if (subtitle != null) ...[
                    SizedBox(height: 4),
                    Text(
                      subtitle!,
                      style: ResponsiveUtils.getResponsiveTextStyle(
                        context,
                        fontSize: ResponsiveUtils.getResponsiveFontSize(
                          context,
                          mobile: 12,
                          tablet: 14,
                          desktop: 16,
                        ),
                        color: isSelected
                            ? AppColors.white.withValues(alpha: 0.8)
                            : (textColor ?? AppColors.textSecondary),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            // Radio indicator
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppColors.white
                      : (textColor ?? AppColors.textSecondary),
                  width: 2,
                ),
                color: isSelected
                    ? AppColors.white
                    : Colors.transparent,
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selectedColor ?? AppColors.primary,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}