import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/default_container.dart';
import 'package:stat_doctor/features/home/data/models/shift_detail_vo.dart';

class MyShiftsDetailsRequirements extends StatelessWidget {
  final ShiftDetailVO shiftsDetailVO;
  const MyShiftsDetailsRequirements({required this.shiftsDetailVO, super.key});

  Widget _buildRequirement(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5.h,
      children: [
        Text(label, style: TextStyles.textViewBold14),
        Text(value, style: TextStyles.textViewMedium14),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      child: Column(
        spacing: 10.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRequirement("Skill level", shiftsDetailVO.skillLevel),
          _buildRequirement("Specialty", shiftsDetailVO.specialty),
          _buildRequirement("Support level", shiftsDetailVO.supportLevel),
          _buildRequirement("Travel provisions", shiftsDetailVO.travelFlag == 1 ? "${shiftsDetailVO.travel} / km" : shiftsDetailVO.travel),
          _buildRequirement("Accommodation provisions", shiftsDetailVO.accommodation),
        ],
      ),
    );
  }
}
