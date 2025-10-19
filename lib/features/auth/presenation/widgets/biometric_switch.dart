import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/app_switch.dart';

class BiometricSwitch extends StatelessWidget {
  final String title;
  final String description;
  final String icon;
  final bool value;
  final void Function(bool)? onChanged;
  const BiometricSwitch({super.key, required this.title, required this.description, required this.icon, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        spacing: 15.h,
        children: [
          Row(
            spacing: 10.w,
            children: [
              AppIcons.icon(icon: icon, color: Theme.of(context).colorScheme.onSurface),
              Text(title, style: TextStyles.textViewMedium16),
            ],
          ),
          Row(
            spacing: 10.w,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Text(description, style: TextStyles.textViewRegular14)),
              AppSwitch(value: value, onChanged: onChanged,)
            ],
          )
        ],
      ),
    );
  }
}