import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/align_text.dart';
import 'package:stat_doctor/features/home/presentation/widgets/home_hospital_card.dart';

class HomeInterestedShifts extends StatelessWidget {
  const HomeInterestedShifts({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          AlignText(
            text: "Shifts you might be interested in",
            style: TextStyles.textViewBold18,
            padding: EdgeInsets.only(left: 25.w, right: 20.w, top: 20.h, bottom: 10.h),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              spacing: 10.w,
              children: List.generate(10, (index) => HomeHospitalCard()),
            ),
          )
        ],
      ),
    );
  }
}