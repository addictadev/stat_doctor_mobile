import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/app_images.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/app_button.dart';
import 'package:stat_doctor/core/widgets/app_cached_network_image.dart';
import 'package:stat_doctor/core/widgets/circle_container.dart';

class AccountHeader extends StatelessWidget {
  const AccountHeader({super.key});

  static final String imageUrl = "https://images.unsplash.com/photo-1656453533096-ecdabe44a82d?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=687";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(25.r)),
        image: DecorationImage(image: AssetImage(AppImages.homeBanner), fit: BoxFit.cover),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          spacing: 15.h,
          children: [
            Row(
              children: [
                Text("Profile", style: TextStyles.textViewBold16.copyWith(color: AppColors.cardColorLight),),
                Spacer(),
                AppButton(
                  flexableWidth: true,
                  color: AppColors.cardColorLight,
                  borderColor: AppColors.borderColorLight,
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  child: Row(
                    spacing: 5.w,
                    children: [
                      AppIcons.icon(icon: AppIcons.editProfile, size: 16, color: AppColors.textColorLight,),
                      Text("Edit Profile", style: TextStyles.textViewMedium12.copyWith(color: AppColors.textColorLight),),
                    ],
                  ),
                )
              ],
            ),
            Row(
              spacing: 10.w,
              children: [
                CircleContainer(
                  size: 65,
                  color: AppColors.cardColorLight,
                  noAlignment: true,
                  child: AppCachedNetworkImage(imageUrl: imageUrl),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Dr. Sarah Cooper", style: TextStyles.textViewBold16.copyWith(color: AppColors.cardColorLight),),
                      Text("sarahcooper@gmail.com", style: TextStyles.textViewMedium13.copyWith(color: AppColors.cardColorLight),),
                      Text("0412 123 123", style: TextStyles.textViewMedium13.copyWith(color: AppColors.cardColorLight),),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}