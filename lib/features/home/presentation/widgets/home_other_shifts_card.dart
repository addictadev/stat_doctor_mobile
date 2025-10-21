import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/features/home/presentation/widgets/home_other_shifts_card_image.dart';

class HomeOtherShiftsCard extends StatelessWidget {
  const HomeOtherShiftsCard({super.key});

  static const String image = "https://plus.unsplash.com/premium_photo-1672097247893-4f8660247b1f?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=1169";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        spacing: 5.h,
        children: [
          HomeOtherShiftsCardImage(image: image),
          Text("St Vincent’s Public Hospital Melbourne", style: TextStyles.textViewBold10, maxLines: 2, overflow: TextOverflow.ellipsis,),
          Expanded(
            child: Row(
              spacing: 5.w,
              children: [
                AppIcons.icon(icon: AppIcons.calendar, size: 10, color: Theme.of(context).hintColor),
                Expanded(child: Text("Mon, 26 Sep 2022", style: TextStyles.textViewMedium10, maxLines: 1, overflow: TextOverflow.ellipsis,)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              spacing: 5.w,
              children: [
                AppIcons.icon(icon: AppIcons.clock, size: 10, color: Theme.of(context).hintColor),
                Expanded(child: Text("10:30 pm - 8:30 am", style: TextStyles.textViewMedium10, maxLines: 1, overflow: TextOverflow.ellipsis,)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}