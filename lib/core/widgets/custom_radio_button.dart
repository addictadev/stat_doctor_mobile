import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRadioButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final double? width;
  final bool isExpanded;

  const CustomRadioButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
    this.isExpanded = false,
    this.width,
  });

  @override
  Widget build(BuildContext context) {    
    return InkWell(
      onTap: onTap,
      overlayColor: WidgetStatePropertyAll(AppColors.transparent),
      child: Row(
        spacing: 5.w,
        children: [
          Container(
            width: 16.w,
            height: 16.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: isSelected ? Theme.of(context).primaryColor : Theme.of(context).hintColor),
            ),
            child: Center(
              child: Container(
                width: 10.w,
                height: 10.h,
                decoration: BoxDecoration(shape: BoxShape.circle, color: isSelected ? Theme.of(context).primaryColor : Theme.of(context).hintColor,),
              ),
            ),
          ),
          isExpanded?
          Expanded(child: Text(text, style: TextStyles.textViewRegular12.copyWith(color: isSelected ? Theme.of(context).primaryColor : Theme.of(context).hintColor),)):
          Text(text, style: TextStyles.textViewRegular12.copyWith(color: isSelected ? Theme.of(context).primaryColor : Theme.of(context).hintColor),)
        ],
      ),
    );
  }
}
