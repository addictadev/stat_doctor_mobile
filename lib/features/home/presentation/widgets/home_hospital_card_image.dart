import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/app_cached_network_image.dart';
import 'package:stat_doctor/features/home/data/models/home_shift_model.dart';

class HomeHospitalCardImage extends StatelessWidget {
  final HomeShiftModel homeShiftModel;

  const HomeHospitalCardImage({super.key, required this.homeShiftModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10.r),
      height: 150.h,
      clipBehavior: Clip.hardEdge,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(15.r),
        image: DecorationImage(image: AppCachedNetworkImage.getImageProvider(homeShiftModel.hospitalVO.hospitalImage), fit: BoxFit.cover)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 10.w,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 5.r),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(100.r),
            ),
            child: Row(
              spacing: 5.w,
              children: [
                AppIcons.icon(icon: AppIcons.location, size: 14, color: Theme.of(context).primaryColor),
                Text("${(homeShiftModel.distance/1000).toStringAsFixed(1)}km", style: TextStyles.textViewBold13.copyWith(color: Theme.of(context).primaryColor),),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 5.r),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(100.r),
            ),
            child: Text("Group (${homeShiftModel.shiftsDaysVOList.length})", style: TextStyles.textViewMedium13),
          )
        ],
      ),
    );
  }
}