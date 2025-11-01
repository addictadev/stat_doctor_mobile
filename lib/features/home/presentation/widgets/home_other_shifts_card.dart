import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/injection/injection_container.dart';
import 'package:stat_doctor/core/navigation/app_navigator.dart';
import 'package:stat_doctor/features/home/data/models/home_shift_model.dart';
import 'package:stat_doctor/features/home/presentation/widgets/home_other_shifts_card_image.dart';
import 'package:stat_doctor/features/shifts/presentation/screens/shifts_details_screen.dart';

class HomeOtherShiftsCard extends StatelessWidget {
  final HomeShiftModel homeShiftModel;
  const HomeOtherShiftsCard({super.key, required this.homeShiftModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {sl<AppNavigator>().push(screen: ShiftsDetailsScreen());},
      overlayColor: WidgetStatePropertyAll(AppColors.transparent),
      child: Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          spacing: 5.h,
          children: [
            HomeOtherShiftsCardImage(homeShiftModel: homeShiftModel),
            Text(homeShiftModel.hospitalVO.hospitalName, style: TextStyles.textViewBold10, maxLines: 2, overflow: TextOverflow.ellipsis,),
            if(homeShiftModel.shiftsDaysVOList.isNotEmpty) ...[
              Expanded(
                child: Row(
                  spacing: 5.w,
                  children: [
                    AppIcons.icon(icon: AppIcons.calendar, size: 10, color: Theme.of(context).hintColor),
                    Expanded(child: Text(homeShiftModel.shiftsDaysVOList.first.shiftsDays, style: TextStyles.textViewMedium10, maxLines: 1, overflow: TextOverflow.ellipsis,)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  spacing: 5.w,
                  children: [
                    AppIcons.icon(icon: AppIcons.clock, size: 10, color: Theme.of(context).hintColor),
                    Expanded(child: Text("${homeShiftModel.shiftsDaysVOList.first.startTimeS} - ${homeShiftModel.shiftsDaysVOList.first.endTimeS}", style: TextStyles.textViewMedium10, maxLines: 1, overflow: TextOverflow.ellipsis,)),
                  ],
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}