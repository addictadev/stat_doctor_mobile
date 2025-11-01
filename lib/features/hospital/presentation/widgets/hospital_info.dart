import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/app_button.dart';
import 'package:stat_doctor/features/home/data/models/home_shift_model.dart';
import 'package:url_launcher/url_launcher.dart';

class HospitalInfo extends StatelessWidget {
  final HomeShiftModel homeShiftModel;
  const HospitalInfo({required this.homeShiftModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
      child: Column(
        spacing: 10.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(homeShiftModel.hospitalVO.hospitalName, style: TextStyles.textViewBold20,),
          Row(
            spacing: 10.w,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppIcons.icon(icon: AppIcons.location, size: 18, color: Theme.of(context).colorScheme.onSurface),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5.h,
                  children: [
                    Text(homeShiftModel.hospitalVO.hospitalLocation, style: TextStyles.textViewMedium14,),
                    Text("${(homeShiftModel.distance/1000).toStringAsFixed(1)} km from current location", style: TextStyles.textViewSemiBold14.copyWith(color: Theme.of(context).primaryColor),),
                  ],
                ),
              ),
            ],
          ),
          AppButton(
            onTap: () {if (homeShiftModel.hospitalVO.webSite.isNotEmpty) {launchUrl(Uri.parse(homeShiftModel.hospitalVO.webSite),);}},
            color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
            border: Border.all(color: Theme.of(context).primaryColor),
            child: Row(
              children: [
                Expanded(child: Text(homeShiftModel.hospitalVO.webSite, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyles.textViewSemiBold14.copyWith(color: Theme.of(context).primaryColor),)),
                Icon(Icons.arrow_forward_ios_rounded, size: 18, color: Theme.of(context).primaryColor,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}