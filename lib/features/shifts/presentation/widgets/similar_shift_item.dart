import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/app_button.dart';
import 'package:stat_doctor/core/widgets/circle_container.dart';
import 'package:stat_doctor/features/shifts/data/model/similar_shift_model.dart';

class SimilarShiftItem extends StatelessWidget {
  final SimilarShift shift;
  final VoidCallback onTap;
  final bool selected;

  const SimilarShiftItem({
    super.key,
    required this.shift,
    required this.onTap,
    required this.selected
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onTap: onTap,
      color: selected ? Theme.of(context).primaryColor.withValues(alpha: 0.1) : Theme.of(context).cardColor,
      borderColor: selected ? Theme.of(context).primaryColor : Theme.of(context).dividerColor,
      child: Row(
        spacing: 5.w,
        children: [
          AppIcons.icon(icon: AppIcons.calendar,size: 16, color: Theme.of(context).hintColor,),
          Expanded(child: Text(shift.date, style: TextStyles.textViewMedium14,)),
          CircleContainer(
            size: 20,
            color: Theme.of(context).dividerColor,
            child: Text("\$",style: TextStyles.textViewBold12.copyWith(color: Theme.of(context).hintColor,),),
          ),
          Text(
            shift.rate,
            style: TextStyles.textViewBold14,
          ),
        ],
      ),
    );
  }
}
