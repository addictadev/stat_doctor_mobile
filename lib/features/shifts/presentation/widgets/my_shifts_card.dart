import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/injection/injection_container.dart';
import 'package:stat_doctor/core/navigation/app_navigator.dart';
import 'package:stat_doctor/features/shifts/presentation/screens/my_shifts_details_screen.dart';
import 'package:stat_doctor/features/shifts/presentation/widgets/my_shifts_card_image.dart';
import 'package:stat_doctor/features/shifts/presentation/widgets/my_shifts_card_rate.dart';

class MyShiftsCard extends StatelessWidget {
  const MyShiftsCard({super.key});

  static const String image = "https://plus.unsplash.com/premium_photo-1672097247893-4f8660247b1f?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=1169";

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {sl<AppNavigator>().push(screen: MyShiftsDetailsScreen());},
      overlayColor: WidgetStatePropertyAll(AppColors.transparent),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(15.r),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          border: Border.all(color: Theme.of(context).dividerColor),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          spacing: 7.h,
          children: [
            MyShiftsCardImage(image: image),
            Text("St Vincent’s Public Hospital  Melbourne", style: TextStyles.textViewBold16,),
            MyShiftsCardRate(),
          ],
        ),
      ),
    );
  }
}