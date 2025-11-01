import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/custom_rich_text.dart';
import 'package:stat_doctor/core/widgets/default_container.dart';
import 'package:stat_doctor/features/home/data/models/home_shift_model.dart';
import 'package:stat_doctor/features/home/data/models/shift_day_vo.dart';
import 'package:stat_doctor/features/home/presentation/widgets/home_hospital_info_item.dart';
import 'package:stat_doctor/features/hospital/presentation/widgets/hospital_card_buttons.dart';
import 'package:stat_doctor/features/hospital/presentation/widgets/hospital_card_rate.dart';

class HospitalShiftCard extends StatelessWidget {
  final ShiftDayVO shiftDayVO;
  final HomeShiftModel homeShiftModel;
  const HospitalShiftCard({required this.shiftDayVO, required this.homeShiftModel, super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      child: Column(
        spacing: 15.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomRichText(
            startSubText: "Rate: ",
            centerSubText: "\$${homeShiftModel.shiftsDaysVOList.first.ratePerHour.toInt()} / hr",
            startSubTextStyle: TextStyles.textViewMedium16.copyWith(color: Theme.of(context).hintColor),
            centerSubTextStyle: TextStyles.textViewBold16,
          ),
          HospitalCardRate(shiftDayVO: shiftDayVO),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15.h,
            children: [
              HomeHospitalInfoItem(title: "Min. skill level: ", value: homeShiftModel.shiftsDetailVO.skillLevel),
              HomeHospitalInfoItem(title: "Specialty: ", value: homeShiftModel.shiftsDetailVO.specialty),
              HomeHospitalInfoItem(title: "Support level: ", value: homeShiftModel.shiftsDetailVO.supportLevel),
            ],
          ),
          Divider(height: 0,),
          HospitalCardButtons(homeShiftModel: homeShiftModel),
        ],
      ),
    );
  }
}