import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/injection/injection_container.dart';
import 'package:stat_doctor/core/navigation/app_navigator.dart';
import 'package:stat_doctor/core/widgets/app_button.dart';
import 'package:stat_doctor/core/widgets/app_dialog.dart';
import 'package:stat_doctor/core/widgets/circle_container.dart';
import 'package:stat_doctor/core/widgets/clickable_text.dart';

class NotificationDeleteDialog extends StatelessWidget {
  const NotificationDeleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 15.h,
        children: [
          CircleContainer(
            size: 90,
            color: Theme.of(context).primaryColor.withValues(alpha: 0.05),
            child: AppIcons.icon(icon: AppIcons.trash, size: 30, color: AppColors.red),
          ),
          Text("Are you sure to delete all notifications?", style: TextStyles.textViewBold16, textAlign: TextAlign.center,),
          AppButton(
            onTap: () {},
            text: "Confirm",
          ),
          ClickableText(
            onTap: sl<AppNavigator>().pop,
            text: "Cancel",
            textStyle: TextStyles.textViewMedium14.copyWith(color: Theme.of(context).hintColor),
          )                           
        ],
      ),
    );
  }
}