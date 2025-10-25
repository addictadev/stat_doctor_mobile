import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/app_cached_network_image.dart';
import 'package:stat_doctor/core/widgets/badge.dart';
import 'package:stat_doctor/core/widgets/default_container.dart';

class MyShiftsDetailsInfo extends StatelessWidget {
  final String image;
  const MyShiftsDetailsInfo({required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
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
                child: AppCachedNetworkImage(imageUrl: image, width: 50.w, height: 50.h),
              ),
              Expanded(child: Text("St Vincent’s Public Hospital  Melbourne", style: TextStyles.textViewBold14, maxLines: 2, overflow: TextOverflow.ellipsis,)),
              AppBadge(title: "Applied",color: AppColors.primaryDark,),
            ],
          ),
          Row(
            spacing: 5.w,
            children: [
              AppIcons.icon(icon: AppIcons.location, size: 14, color: Theme.of(context).colorScheme.onSurface),
              Text("300 Grattan St, Parkville VIC 3050", style: TextStyles.textViewMedium14,),
            ],
          ),
          Text("6.9km from current location", style: TextStyles.textViewSemiBold14.copyWith(color: Theme.of(context).primaryColor),),
        ],
      )
    );
  }
}