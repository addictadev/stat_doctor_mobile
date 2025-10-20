import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/align_text.dart';
import 'package:stat_doctor/core/widgets/app_button.dart';

class HaveRestictions extends StatefulWidget {
  final ValueNotifier<bool> haveRestrictions;
  const HaveRestictions({super.key, required this.haveRestrictions});
  @override
  State<HaveRestictions> createState() => _HaveRestictionsState();
}

class _HaveRestictionsState extends State<HaveRestictions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AlignText(
          text: "Do you have any restrictions on your AHPRA license?",
          style: TextStyles.textViewMedium14,
          padding: EdgeInsetsDirectional.only(start: 5.w, top: 15.h, bottom: 5.h),
        ),
        Row(
          spacing: 10.w,
          children: [
            Expanded(
              child: AppButton(
                onTap: () {setState(() {widget.haveRestrictions.value = false;});},
                text: "No",
                padding: EdgeInsets.symmetric(vertical: 10.h),
                textColor: widget.haveRestrictions.value ? Theme.of(context).colorScheme.onSurface : Theme.of(context).primaryColor,
                borderColor: widget.haveRestrictions.value ? Theme.of(context).dividerColor : Theme.of(context).primaryColor,
                color: widget.haveRestrictions.value ? Theme.of(context).cardColor : Theme.of(context).primaryColor.withValues(alpha: 0.15),
              )
            ),
            Expanded(
              child: AppButton(
                onTap: () {setState(() {widget.haveRestrictions.value = true;});},
                text: "Yes",
                padding: EdgeInsets.symmetric(vertical: 10.h),
                textColor: widget.haveRestrictions.value ? Theme.of(context).primaryColor : Theme.of(context).colorScheme.onSurface,
                borderColor: widget.haveRestrictions.value ? Theme.of(context).primaryColor : Theme.of(context).dividerColor,
                color: widget.haveRestrictions.value ? Theme.of(context).primaryColor.withValues(alpha: 0.15) : Theme.of(context).cardColor,
              )
            )
          ],
        )

      ],
    );
  }
}