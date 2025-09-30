import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/utils/styles/styles.dart';

class UpcomingPastToggle extends StatelessWidget {
  final bool isUpcoming;
  final ValueChanged<bool> onToggle;

  const UpcomingPastToggle({
    super.key,
    required this.isUpcoming,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.5.h,
      width: 55.w,
      padding: EdgeInsets.all( 1.5.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Colors.white.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onToggle(true),
              child: Container(
        
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isUpcoming ? Colors.white : Colors.transparent,
                    width: 1,
                  ),
                  color: isUpcoming ? Colors.white.withOpacity(0.6) : Colors.transparent,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    'upcoming'.tr(),
                    style: TextStyles.textViewSemiBold14.copyWith(
                      color: isUpcoming ? AppColors.primary : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => onToggle(false),
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: !isUpcoming ? Colors.white : Colors.transparent,
                    width: 1,
                  ),
                  color: !isUpcoming ? Colors.white.withOpacity(0.6) : Colors.transparent,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    'past'.tr(),
                    style: TextStyles.textViewSemiBold14.copyWith(
                      color: !isUpcoming ? AppColors.primary : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
