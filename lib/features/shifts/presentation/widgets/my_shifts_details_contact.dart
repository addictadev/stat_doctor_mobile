import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/default_container.dart';
import 'package:stat_doctor/features/home/data/models/home_shift_model.dart';

class MyShiftsDetailsContact extends StatelessWidget {
  final HomeShiftModel homeShiftModel;
  const MyShiftsDetailsContact({required this.homeShiftModel, super.key});

  Widget _buildContact(BuildContext context, String label, String value) {
    return Row(
      spacing: 10.w,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyles.textViewMedium14.copyWith(color: Theme.of(context).hintColor)),
        Expanded(child: Text(value, style: TextStyles.textViewSemiBold14),),
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
          Text("Contact details", style: TextStyles.textViewBold16),
          _buildContact(context, "Name", homeShiftModel.hospitalVO.hospitalName),
          _buildContact(context, "Phone", homeShiftModel.hospitalVO.mobileNumber),
          _buildContact(context, "Email", homeShiftModel.hospitalVO.email),
        ],
      ),
    );
  }
}
