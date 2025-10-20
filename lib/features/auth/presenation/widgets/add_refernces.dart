

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';

class AddRefernces extends StatelessWidget {
  final Function() onAdd;
  const AddRefernces({required this.onAdd, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onAdd,
      overlayColor: WidgetStatePropertyAll(AppColors.transparent),
      child: Row(
        spacing: 10.w,
        children: [
          SizedBox(width: 5.w,),
          AppIcons.icon(icon: AppIcons.add, size: 14, color: Theme.of(context).primaryColor),
          Text(
            "Add another reference",
            style: TextStyles.textViewMedium14.copyWith(color: Theme.of(context).primaryColor),
          ),
        ],
      ),
    );
  }
}