import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/custom_rich_text.dart';
import 'package:stat_doctor/core/widgets/default_container.dart';

class MyShiftsDetailsRate extends StatelessWidget {
  const MyShiftsDetailsRate({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      child: Column(
        spacing: 10.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomRichText(
            startSubText: "Rate:  ",
            endSubText: "\$150 / hr",
            startSubTextStyle: TextStyles.textViewMedium14,
            endSubTextStyle: TextStyles.textViewBold18,
          ),
          Row(
            spacing: 10.w,
            children: [
              AppIcons.icon(icon: AppIcons.calendar, size: 16, color: Theme.of(context).colorScheme.onSurface),
              Text("Thu, 20 Oct 2022", style: TextStyles.textViewMedium14),
            ],
          ),
          Row(
            spacing: 10.w,
            children: [
              AppIcons.icon(icon: AppIcons.clock, size: 16, color: Theme.of(context).colorScheme.onSurface),
              Text("10:30 pm - 8:30 am (10 hrs)", style: TextStyles.textViewMedium14),
            ],
          ),
        ],
      ),
    );
  }
}
