import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';

class BnbIcon extends StatelessWidget {
  final String text;
  final String icon;
  final bool selected;
  final Function() onTap;

  const BnbIcon({
    required this.text,
    required this.icon,
    required this.onTap,
    this.selected = false,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        overlayColor: WidgetStatePropertyAll(AppColors.transparent),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 5.h,
          children: [
            AppIcons.icon(icon: icon, size: 18, color: selected ? Theme.of(context).cardColor : Theme.of(context).hintColor),
            Text(text, style: TextStyles.textViewRegular12.copyWith(color: selected? Theme.of(context).cardColor : Theme.of(context).hintColor),maxLines: 1,overflow: TextOverflow.ellipsis,)
          ],
        ).animate(value: selected ? 0 : 1,).flip(duration: 300.ms)
      ),
    );
  }
}