import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/app_images.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/circle_container.dart';
import 'package:stat_doctor/core/widgets/search_formfield.dart';

class HomeHeader extends StatelessWidget {
  final TextEditingController searchController;
  const HomeHeader({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return SliverFloatingHeader(
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.3,
        padding: EdgeInsets.all(15.r),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(25.r)),
          image: DecorationImage(image: AssetImage(AppImages.homeBanner), fit: BoxFit.cover),
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10.h,
            children: [
              Text("Welcome to", style: TextStyles.textViewMedium18.copyWith(color: AppColors.cardColorLight),),
              Image.asset(AppImages.logoWhite, width: MediaQuery.sizeOf(context).width * 0.5),
              Spacer(),
              Row(
                spacing: 10.w,
                children: [
                  Expanded(
                    child: SearchFormField(
                      controller: TextEditingController(),
                      hintText: "Search hospital or location..."
                    )
                  ),
                  CircleContainer(
                    size: 50,
                    color: AppColors.cardColorLight,
                    child: AppIcons.icon(icon: AppIcons.filter, color: AppColors.green),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}