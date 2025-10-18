import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/extensions/localization.dart';
import 'package:stat_doctor/core/widgets/clickable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppEmptyWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onAction;
  
  const AppEmptyWidget({
    required this.message,
    this.onAction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inbox_outlined,
            size: 64.w,
            color: Theme.of(context).hintColor,
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: 300.w,
            child: Text(
              message,
              style: TextStyles.textViewBold16,
              textAlign: TextAlign.center,
            ),
          ),
          if (onAction != null) ...[
            SizedBox(height: 16.h),
            ClickableText(
              text: context.tr.tryAgain,
              onTap: onAction,
            ),
          ],
        ],
      ),
    );
  }
} 