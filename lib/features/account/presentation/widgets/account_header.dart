import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/app_images.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/app_button.dart';
import 'package:stat_doctor/core/widgets/app_cached_network_image.dart';
import 'package:stat_doctor/core/widgets/circle_container.dart';
import 'package:stat_doctor/features/account/data/models/user_model.dart';

class AccountHeader extends StatelessWidget {
  final UserModel user;
  const AccountHeader({super.key, required this.user});

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
                  onTap: () {
                    log(user.userInfoVO?.profilePic ?? '');
                  },
                  size: 65,
                  color: AppColors.cardColorLight,
                  noAlignment: true,
                  child: AppCachedNetworkImage(imageUrl: user.userInfoVO?.profilePic),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Dr. ${user.userInfoVO?.firstName} ${user.userInfoVO?.surname}", style: TextStyles.textViewBold16.copyWith(color: AppColors.cardColorLight),),
                      Text("${user.userInfoVO?.email}", style: TextStyles.textViewMedium13.copyWith(color: AppColors.cardColorLight),),
                      Text("${user.userInfoVO?.phoneCode} ${user.userInfoVO?.mobileNumber}", style: TextStyles.textViewMedium13.copyWith(color: AppColors.cardColorLight),),
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