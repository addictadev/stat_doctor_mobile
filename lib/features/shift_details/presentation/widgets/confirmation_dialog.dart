import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stat_doctor/core/theme/app_colors.dart';
import 'package:stat_doctor/core/utils/styles/styles.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.message,
    required this.confirmText,
    required this.cancelText,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 80.w,
        padding: EdgeInsets.all(6.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(6.w),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            Text(
              title,
              style: TextStyles.textViewBold18.copyWith(
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            
            SizedBox(height: 2.h),
            
            // Message
            Text(
              message,
              style: TextStyles.textViewRegular14.copyWith(
                color: AppColors.textSecondary,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            
            SizedBox(height: 4.h),
            
            // Confirm Button
            Container(
              width: double.infinity,
              height: 6.h,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(30.w),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(30.w),
                  onTap: onConfirm,
                  child: Center(
                    child: Text(
                      confirmText,
                      style: TextStyles.textViewBold16.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            
            SizedBox(height: 2.h),
            
            // Cancel Button
            TextButton(
              onPressed: onCancel,
              child: Text(
                cancelText,
                style: TextStyles.textViewRegular14.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
