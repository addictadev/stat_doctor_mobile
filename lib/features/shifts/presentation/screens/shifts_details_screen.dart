import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/widgets/app_appbar.dart';
import 'package:stat_doctor/core/widgets/app_button.dart';
import 'package:stat_doctor/features/shifts/data/enums/my_shifts_status.dart';
import 'package:stat_doctor/features/shifts/presentation/widgets/my_shifts_details_contact.dart';
import 'package:stat_doctor/features/shifts/presentation/widgets/my_shifts_details_description.dart';
import 'package:stat_doctor/features/shifts/presentation/widgets/my_shifts_details_info.dart';
import 'package:stat_doctor/features/shifts/presentation/widgets/my_shifts_details_rate.dart';
import 'package:stat_doctor/features/shifts/presentation/widgets/my_shifts_details_requirements.dart';
import 'package:stat_doctor/features/shifts/presentation/widgets/my_shifts_details_similar_shifts.dart';

class ShiftsDetailsScreen extends StatefulWidget {
  const ShiftsDetailsScreen({super.key});
  @override
  State<ShiftsDetailsScreen> createState() => _ShiftsDetailsScreenState();
}

class _ShiftsDetailsScreenState extends State<ShiftsDetailsScreen> {
  MyShiftsStatus myShiftsStatus = MyShiftsStatus.applied;

  static const String image = "https://plus.unsplash.com/premium_photo-1672097247893-4f8660247b1f?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=1169";

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
            AppButton(text: "Apply (2 shifts)",),
          ],
        ),
      ),
      appBar: AppAppbar(title: Text("Shift Detials")),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h, bottom: 30.h),
        child: Column(
          spacing: 15.h,
          children: [
            MyShiftsDetailsInfo(image: image,),
            MyShiftsDetailsDescription(),
            MyShiftsDetailsRate(),
            MyShiftsDetailsRequirements(),
            MyShiftsDetailsContact(),
            MyShiftsDetailsSimilarShifts(),
          ],
        ),
      )
    );
  }
}