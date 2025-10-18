import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/extensions/localization.dart';
import 'package:stat_doctor/core/widgets/circle_container.dart';
import 'package:stat_doctor/core/widgets/clickable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppErrorWidget extends StatelessWidget {
  final VoidCallback? onRetry;

  const AppErrorWidget({this.onRetry, super.key,});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleContainer(
            color: Theme.of(context).cardColor,
            size: 60,
            child: AppIcons.icon(icon: AppIcons.close,size: 30),
          ),
          SizedBox(height: 16.h),
          Text(
            context.tr.noResults,
            style: TextStyles.textViewBold12,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5.h),
          Text(
            context.tr.noDataToDisplay,
            style: TextStyles.textViewBold10.copyWith(fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          if (onRetry != null) ...[
            SizedBox(height: 16.h),
            ClickableText(
              text: context.tr.retry,
              onTap: onRetry,
            ),
          ],
        ],
      ),
    );
  }
}