import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/utils/styles/styles.dart';

class ShiftStatusBadge extends StatelessWidget {
  final String status;
  final String? groupSize;

  const ShiftStatusBadge({
    super.key,
    required this.status,
    this.groupSize,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;
    String displayText;

    switch (status.toLowerCase()) {

      default:
            backgroundColor = AppColors.greenOverlay;
        textColor = Colors.green;
        displayText = status;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (groupSize != null) ...[
            Text(
              'Group ($groupSize)',
              style: TextStyles.textViewBold14.copyWith(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ] else ...[
            Text(
              displayText,
              style: TextStyles.textViewRegular14.copyWith(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
