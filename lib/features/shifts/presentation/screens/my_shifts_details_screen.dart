import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/app_appbar.dart';
import 'package:stat_doctor/core/widgets/app_button.dart';
import 'package:stat_doctor/core/widgets/clickable_text.dart';
import 'package:stat_doctor/features/shifts/data/enums/my_shifts_status.dart';
import 'package:stat_doctor/features/shifts/presentation/widgets/my_shifts_details_description.dart';
import 'package:stat_doctor/features/shifts/presentation/widgets/my_shifts_details_reviews.dart';

class MyShiftsDetailsScreen extends StatefulWidget {
  const MyShiftsDetailsScreen({super.key});
  @override
  State<MyShiftsDetailsScreen> createState() => _MyShiftsDetailsScreenState();
}

class _MyShiftsDetailsScreenState extends State<MyShiftsDetailsScreen> {
  MyShiftsStatus myShiftsStatus = MyShiftsStatus.applied;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h, bottom: 30.h),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 10.h,
          children: [
            AppButton(text: "Withdraw Application",),
            ClickableText(
              text: "Cancel Shift",
              textStyle: TextStyles.textViewSemiBold14.copyWith(color: Theme.of(context).hintColor),
            )
          ],
        ),
      ),
      appBar: AppAppbar(title: Text("Shift Detials")),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h, bottom: 30.h),
        child: Column(
          spacing: 15.h,
          children: [
            // MyShiftsDetailsInfo(image: image,),
            MyShiftsDetailsDescription(description: "description",),
            // MyShiftsDetailsRate(),
            // MyShiftsDetailsRequirements(),
            // MyShiftsDetailsContact(),
            MyShiftsDetailsReviews(),
          ],
        ),
      )
    );
  }
}