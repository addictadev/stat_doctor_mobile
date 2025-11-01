import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/app_cached_network_image.dart';
import 'package:stat_doctor/core/widgets/badge.dart';
import 'package:stat_doctor/core/widgets/default_container.dart';
import 'package:stat_doctor/features/home/data/models/home_shift_model.dart';

class MyShiftsDetailsInfo extends StatelessWidget {
  final Function()? onTap;
  final HomeShiftModel homeShiftModel;
  const MyShiftsDetailsInfo({this.onTap, required this.homeShiftModel, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DefaultContainer(
        child: Column(
          spacing: 10.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10.w,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: AppCachedNetworkImage(imageUrl: homeShiftModel.hospitalVO.hospitalImage, width: 50.w, height: 50.h),
                ),
                Expanded(child: Text(homeShiftModel.hospitalVO.hospitalName, style: TextStyles.textViewBold14, maxLines: 2, overflow: TextOverflow.ellipsis,)),
                if(homeShiftModel.shiftsDetailVO.shiftsType?.isNotEmpty ?? false)
                AppBadge(title: homeShiftModel.shiftsDetailVO.shiftsType, color: AppColors.primaryDark,),
              ],
            ),
            Row(
              spacing: 5.w,
              children: [
                AppIcons.icon(icon: AppIcons.location, size: 14, color: Theme.of(context).colorScheme.onSurface),
                Text(homeShiftModel.hospitalVO.hospitalLocation, style: TextStyles.textViewMedium14,),
              ],
            ),
            Text("${(homeShiftModel.distance/1000).toStringAsFixed(1)} km from current location", style: TextStyles.textViewSemiBold14.copyWith(color: Theme.of(context).primaryColor),),
          ],
        )
      ),
    );
  }
}