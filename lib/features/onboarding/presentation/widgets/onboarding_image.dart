import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/app_images.dart';

class OnboardingImage extends StatelessWidget {
  const OnboardingImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.5,
      margin: EdgeInsets.only(left: 75.w, right: 75.w, top: 25.h, bottom: 25.h),
      padding: EdgeInsets.all(50.r),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.9, 1.0],
          colors: [
            Theme.of(context).primaryColor,
            AppColors.scaffoldColorLight,
          ],
        ),
      ),
      child: Image.asset(AppImages.logoWhite,),
    );
  }
}