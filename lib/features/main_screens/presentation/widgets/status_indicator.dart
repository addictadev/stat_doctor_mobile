import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/styles/styles.dart';
import '../../../../core/utils/styles/font_utils.dart';

class StatusIndicator extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isAvailable;
  final bool isSmall;

  const StatusIndicator({
    super.key,
    required this.icon,
    required this.text,
    required this.isAvailable,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          isAvailable ? Icons.check : Icons.close,
          color: isAvailable ? AppColors.success : AppColors.error,
          size: isSmall ? 4.w : 5.w,
        ),
        SizedBox(width: 1.w),
        Text(
          text,
          style: (isSmall ? TextStyles.textViewRegular12 : TextStyles.textViewRegular14).copyWith(
            color:isSmall?AppColors.white: AppColors.black,
            fontWeight: AppFont.semiBold,
          ),
        ),
      ],
    );
  }
}
