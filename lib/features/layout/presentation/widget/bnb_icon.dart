import 'package:flutter/material.dart';
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
          spacing: 5.h,
          children: [
            Container(height: 1.75.h, color: selected ? Theme.of(context).colorScheme.surface : null, margin: EdgeInsets.only(bottom: 10),),
            AppIcons.icon(icon: icon, size: 18, color: selected ? Theme.of(context).colorScheme.surface : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor),
            Text(text, style: TextStyles.textViewRegular12.copyWith(color: selected? Theme.of(context).colorScheme.surface : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor),maxLines: 1,overflow: TextOverflow.ellipsis,)
          ],
        )
      ),
    );
  }
}