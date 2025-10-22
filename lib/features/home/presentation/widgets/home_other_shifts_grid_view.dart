import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/features/home/presentation/widgets/home_other_shifts_card.dart';

class HomeOtherShiftsGridView extends StatelessWidget {
  const HomeOtherShiftsGridView({super.key,});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      sliver: SliverGrid.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 10.w,
        ),
        itemCount: 10,
        itemBuilder: (context, index) => HomeOtherShiftsCard(),
      ),
    );
  }
}