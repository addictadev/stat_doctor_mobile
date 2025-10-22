import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/navigation/app_navigator.dart';
import 'package:stat_doctor/core/injection/injection_container.dart';
import 'package:flutter/material.dart';

class PopupHeader extends StatelessWidget {
  final String title;
  final bool showTopDivider;
  const PopupHeader({super.key, required this.title, this.showTopDivider = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15.h,
      children: [
        if(showTopDivider)
        Center(
          child: Container(
            width: 50.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: Theme.of(context).disabledColor,
              borderRadius: BorderRadius.circular(100.r),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(child: Text(title, style: TextStyles.textViewBold16,)),
            InkWell(
              onTap: sl<AppNavigator>().pop,
              overlayColor: WidgetStatePropertyAll(AppColors.transparent),
              child: AppIcons.icon(icon: AppIcons.failure, size: 16, color: Theme.of(context).hintColor)
            )
          ],
        ),
      ],
    );
  }
}