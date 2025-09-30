import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stat_doctor/core/theme/app_colors.dart';
import 'package:stat_doctor/core/utils/styles/styles.dart';
import 'package:stat_doctor/core/utils/responsive_utils.dart';

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final Color? iconColor;
  final Widget? trailing;
  final bool showDivider;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.onTap,
    this.iconColor,
    this.trailing,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: AppColors.white,
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
                vertical: 4.h,
              ),
              child: Row(
                children: [
                  // Icon
                  Container(
                    width: context.responsiveIconSize * 1.2,
                    height: context.responsiveIconSize * 1.2,
                    decoration: BoxDecoration(
                      color: (iconColor ?? AppColors.primary).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      icon,
                      color: iconColor ?? AppColors.primary,
                      size: context.responsiveIconSize * 0.6,
                    ),
                  ),
                  
                  SizedBox(width: 4.w),
                  
                  // Title and Subtitle
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyles.textViewMedium16.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        if (subtitle != null) ...[
                          SizedBox(height: 0.5.h),
                          Text(
                            subtitle!,
                            style: TextStyles.textViewRegular12.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  
                  // Trailing widget or default chevron
                  trailing ?? Icon(
                    Icons.chevron_right,
                    color: AppColors.textSecondary,
                    size: context.responsiveIconSize * 0.6,
                  ),
                ],
              ),
            ),
          ),
        ),
        
        // Divider
        if (showDivider)
          Container(
            margin: EdgeInsets.only(left: 12.w),
            height: 1,
            color: AppColors.borderLight,
          ),
      ],
    );
  }
}
