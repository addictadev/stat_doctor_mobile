import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/default_container.dart';

class MyShiftsDetailsContact extends StatelessWidget {
  const MyShiftsDetailsContact({super.key});

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
          _buildContact(context, "Name", "Megan Carpenter"),
          _buildContact(context, "Phone", "(03) 9529 1234"),
          _buildContact(context, "Email", "info@gmail.com.au"),
        ],
      ),
    );
  }
}
