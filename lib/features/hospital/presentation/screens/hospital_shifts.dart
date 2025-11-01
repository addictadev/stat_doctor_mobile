import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/default_container.dart';
import 'package:stat_doctor/features/home/data/models/home_shift_model.dart';
import 'package:stat_doctor/features/hospital/presentation/widgets/hospital_shift_card.dart';

class HospitalShifts extends StatelessWidget {
  final HomeShiftModel homeShiftModel;
  const HospitalShifts({required this.homeShiftModel, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h),
      child: DefaultContainer(
        child: Column(
          spacing: 10.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("All hospital shifts", style: TextStyles.textViewBold16,),
            Column(
              spacing: 10.h,
              children: List.generate(
                homeShiftModel.shiftsDaysVOList.length,
                (index) => HospitalShiftCard(shiftDayVO: homeShiftModel.shiftsDaysVOList[index], homeShiftModel: homeShiftModel,),
              ),
            )
          ],
        ),
      ),
    );
  }
}