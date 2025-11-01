import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_images.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';

class NoHomeData extends StatelessWidget {
  const NoHomeData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.r),
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10.h,
        children: [
          Image.asset(AppImages.noData, width: 100.w,),
          Text("No shift information available at the moment", style: TextStyles.textViewBold16, textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}