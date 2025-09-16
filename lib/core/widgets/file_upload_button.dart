import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../utils/responsive_utils.dart';

class FileUploadButton extends StatelessWidget {
  final String label;
  final String? fileName;
  final VoidCallback onTap;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? width;
  final double? height;

  const FileUploadButton({
    super.key,
    required this.label,
    this.fileName,
    required this.onTap,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 60,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.white,
          borderRadius: BorderRadius.circular(
            ResponsiveUtils.getResponsiveBorderRadius(context),
          ),
          border: Border.all(
            color: borderColor ?? AppColors.borderLight,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon ?? Icons.upload,
              color: textColor ?? AppColors.primary,
              size: 20,
            ),
            SizedBox(width: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: ResponsiveUtils.getResponsiveTextStyle(
                    context,
                    fontSize: ResponsiveUtils.getResponsiveFontSize(
                      context,
                      mobile: 14,
                      tablet: 16,
                      desktop: 18,
                    ),
                    fontWeight: FontWeight.w600,
                    color: textColor ?? AppColors.textPrimary,
                  ),
                ),
                if (fileName != null) ...[
                  SizedBox(height: 2),
                  Text(
                    fileName!,
                    style: ResponsiveUtils.getResponsiveTextStyle(
                      context,
                      fontSize: ResponsiveUtils.getResponsiveFontSize(
                        context,
                        mobile: 12,
                        tablet: 14,
                        desktop: 16,
                      ),
                      color: textColor ?? AppColors.textSecondary,
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
