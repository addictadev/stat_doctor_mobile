import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/widgets/app_cached_network_image.dart';
import 'package:stat_doctor/features/home/data/models/home_shift_model.dart';
import 'package:stat_doctor/features/home/presentation/widgets/home_other_shifts_card_buttons.dart';
import 'package:stat_doctor/features/home/presentation/widgets/home_shifts_card_info_item.dart';

class HomeOtherShiftsCardImage extends StatelessWidget {
  final HomeShiftModel homeShiftModel;
  const HomeOtherShiftsCardImage({super.key, required this.homeShiftModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120.h,
      clipBehavior: Clip.hardEdge,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10.r),
        image: DecorationImage(image: AppCachedNetworkImage.getImageProvider(homeShiftModel.hospitalVO.hospitalImage), fit: BoxFit.cover)
      ),
      child: Column(
        spacing: 5.h,
        children: [
          Padding(
            padding: EdgeInsets.all(5.r),
            child: Column(
              spacing: 5.h,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  spacing: 10.w,
                  children: [
                    HomeShiftsCardInfoItem(text: homeShiftModel.shiftsDetailVO.skillLevel,),
                    HomeShiftsCardInfoItem(text: "${(homeShiftModel.distance/1000).toStringAsFixed(1)}km", icon: AppIcons.location,),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  spacing: 10.w,
                  children: [
                    HomeShiftsCardInfoItem(text: homeShiftModel.shiftsDetailVO.specialty,),
                    homeShiftModel.shiftsDetailVO.otherRate?.isNotEmpty ?? false?
                    HomeShiftsCardInfoItem(text: homeShiftModel.shiftsDetailVO.otherRate??''):
                    Expanded(child: SizedBox())

                  ],
                ),
              ],
            ),
          ),
          Spacer(),

          Container(
            width: double.infinity,
            padding: EdgeInsets.all(5.r),
            decoration: BoxDecoration(
              color: AppColors.cardColorDark.withValues(alpha: 0.7),
            ),
            child: HomeOtherShiftsCardButtons(homeShiftModel: homeShiftModel,),
          ),

        ],
      ),
    );
  }
}