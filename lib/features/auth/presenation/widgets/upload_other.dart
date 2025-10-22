import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';

class UploadOther extends StatelessWidget {
  final Function() onTap;
  const UploadOther({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      overlayColor: WidgetStatePropertyAll(AppColors.transparent),
      child: Row(
        spacing: 10.w,
        children: [
          SizedBox(width: 5.w,),
          AppIcons.icon(icon: AppIcons.add, size: 14, color: Theme.of(context).primaryColor),
          Text(
            "Upload other document",
            style: TextStyles.textViewMedium14.copyWith(color: Theme.of(context).primaryColor),
          ),
        ],
      ),
    );
  }
}