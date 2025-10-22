import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/app_images.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/injection/injection_container.dart';
import 'package:stat_doctor/core/navigation/app_navigator.dart';
import 'package:stat_doctor/features/shifts/presentation/widgets/select_my_shifts_type.dart';

class MyShiftsAppbar extends StatelessWidget implements PreferredSizeWidget {
  final List<String> shiftTypes;
  final int currentShiftTypeIndex;
  final Function(int) onShiftTypeChanged;
  const MyShiftsAppbar({super.key, required this.shiftTypes, required this.currentShiftTypeIndex, required this.onShiftTypeChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.2,
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(25.r)),
        image: DecorationImage(image: AssetImage(AppImages.homeBanner), fit: BoxFit.cover),
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          spacing: 10.h,
          children: [
            Text("Shifts", style: TextStyles.textViewBold20.copyWith(color: AppColors.cardColorLight),),
            Spacer(),
            SelectMyShiftsType(
              shiftTypes: shiftTypes,
              currentShiftTypeIndex: currentShiftTypeIndex,
              onShiftTypeChanged: onShiftTypeChanged,
            ),
          ],
        ),
      ),
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(MediaQuery.sizeOf(sl<AppNavigator>().navigatorKey.currentState!.context).height * 0.2);
}