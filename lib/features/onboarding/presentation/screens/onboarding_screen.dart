import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/app_images.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/custom_rich_text.dart';
import 'package:stat_doctor/features/onboarding/presentation/widgets/onboarding_details.dart';
import 'package:stat_doctor/features/onboarding/presentation/widgets/onboarding_image.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImages.onboarding, width: double.infinity, height: double.infinity, fit: BoxFit.cover),
          SafeArea(
            child: Column(
              children: [                
                OnboardingImage(),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(20.r),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomRichText(
                          startSubText: 'Finding your job in just a few clicks',
                          centerSubText: ' few ',
                          endSubText: 'clicks',
                          textAlign: TextAlign.center,
                          startSubTextStyle: TextStyles.textViewBold32,
                          centerSubTextStyle: TextStyles.textViewBold32.copyWith(color: AppColors.green, height: 1.3),
                          endSubTextStyle: TextStyles.textViewBold32.copyWith(color: AppColors.primaryDark, height: 1.3),
                        ),
                        OnboardingDetails(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}