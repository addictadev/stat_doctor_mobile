import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/app_cached_network_image.dart';
import 'package:stat_doctor/core/widgets/badge.dart';
import 'package:stat_doctor/core/widgets/circle_container.dart';
import 'package:stat_doctor/core/widgets/default_container.dart';

class MyShiftsDetailsReviews extends StatelessWidget {
  const MyShiftsDetailsReviews({super.key});

  static const String image = "https://images.unsplash.com/photo-1559839734-2b71ea197ec2?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=1000";

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.h,
        children: [
          Text("Reviews and Ratings", style: TextStyles.textViewBold16),
          DefaultContainer(
            child: Column(
              spacing: 10.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 10.w,
                  children: [
                    CircleContainer(
                      size: 50.r,
                      noAlignment: true,
                      child: AppCachedNetworkImage(imageUrl: image,),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Dr. Sarah Cooper", style: TextStyles.textViewBold14),
                          Text("25 Oct 2025", style: TextStyles.textViewMedium13.copyWith(color: Theme.of(context).hintColor)),
                        ],
                      ),
                    ),
                    AppBadge(
                      color: AppColors.orange,
                      radius: 10.r,
                      child: Row(
                        spacing: 5.w,
                        children: [
                          AppIcons.icon(icon: AppIcons.star, size: 12, color: AppColors.orange),
                          Text("4.5", style: TextStyles.textViewBold12.copyWith(color: AppColors.orange),),
                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                  "The treatment of the hospital is very good, the environment is clean and hygienic, and I am very honored to participate in this shift.",
                  style: TextStyles.textViewSemiBold14,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
