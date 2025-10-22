import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/widgets/app_button.dart';

class AvailableShiftButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final bool isSelected;
  const AvailableShiftButton({super.key, required this.onTap, required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onTap: onTap,
      text: text,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      textColor: isSelected ? Theme.of(context).primaryColor : Theme.of(context).colorScheme.onSurface,
      borderColor: isSelected ? Theme.of(context).primaryColor : Theme.of(context).dividerColor,
      color: isSelected ? Theme.of(context).primaryColor.withValues(alpha: 0.15) : Theme.of(context).cardColor,
    );
  }
}