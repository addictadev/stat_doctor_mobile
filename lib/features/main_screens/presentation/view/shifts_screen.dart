import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/styles/styles.dart';
import '../../../../core/utils/styles/font_utils.dart';

class ShiftsScreen extends StatelessWidget {
  const ShiftsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'shifts'.tr(),
          style: TextStyles.textViewSemiBold18.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.work,
              size: 15.w,
              color: AppColors.textSecondary,
            ),
            SizedBox(height: 2.h),
            Text(
              'shifts_coming_soon'.tr(),
              style: TextStyles.textViewRegular16.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
