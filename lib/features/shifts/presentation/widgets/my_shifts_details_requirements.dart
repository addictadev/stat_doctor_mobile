import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/default_container.dart';

class MyShiftsDetailsRequirements extends StatelessWidget {
  const MyShiftsDetailsRequirements({super.key});

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
          _buildRequirement("Skill level", "VMO/SMO"),
          _buildRequirement("Specialty", "Emergency Medicine"),
          _buildRequirement("Support level", "Senior on site"),
          _buildRequirement("Travel provisions", "\$0.72/km, no flights included"),
          _buildRequirement("Accommodation provisions", "Not included"),
        ],
      ),
    );
  }
}
