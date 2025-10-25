import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/widgets/app_appbar.dart';
import 'package:stat_doctor/features/shifts/datat/enums/my_shifts_status.dart';
import 'package:stat_doctor/features/shifts/presentation/widgets/my_shifts_details_description.dart';
import 'package:stat_doctor/features/shifts/presentation/widgets/my_shifts_details_info.dart';

class MyShiftsDetailsScreen extends StatefulWidget {
  const MyShiftsDetailsScreen({super.key});
  @override
  State<MyShiftsDetailsScreen> createState() => _MyShiftsDetailsScreenState();
}

class _MyShiftsDetailsScreenState extends State<MyShiftsDetailsScreen> {
  MyShiftsStatus myShiftsStatus = MyShiftsStatus.applied;

  static const String image = "https://plus.unsplash.com/premium_photo-1672097247893-4f8660247b1f?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=1169";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(title: Text("Shift Detials")),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          spacing: 15.h,
          children: [
            MyShiftsDetailsInfo(image: image,),
            MyShiftsDetailsDescription(),
          ],
        ),
      )
    );
  }
}