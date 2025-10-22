import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/theme/time_line_theme.dart';
import 'package:timelines_plus/timelines_plus.dart';

class SignupStepper extends StatelessWidget {
  final ValueChanged<int> onStepTap;
  final int currentStep;
  const SignupStepper({super.key, required this.onStepTap, required this.currentStep});

  static final List<String> stepLabels = [
    "Personal info",
    "Medical Info", 
    "References",
    "Documentation"
  ];

  Color getColor(BuildContext context, bool value) => value ? Theme.of(context).primaryColor : Theme.of(context).disabledColor;
  Color getIndicatorColor(BuildContext context, bool value) => value ? Theme.of(context).primaryColor : AppColors.transparent;
  Widget getText(BuildContext context, bool value, int index) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
    child: Text(
      stepLabels[index],
      style: TextStyles.textViewMedium10.copyWith(color: value ? null : Theme.of(context).disabledColor),
    ),
  );

  Widget? getIndicator(BuildContext context, int index,) {
    if(index < currentStep) {
      return Center(child: AppIcons.icon(icon: AppIcons.right, color: AppColors.cardColorLight, size: 7.r));
    } else if(index == currentStep) {
      return Center(child: DotIndicator(size: 5.r, color: Theme.of(context).primaryColor,),);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75.h,
      padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child:  FixedTimeline(
        theme: TimeLineTheme.timelineThemeData(context),
        children: [
          TimelineTile(
            node: TimelineNode(
              indicator: InkWell(
                onTap: () {onStepTap(0);},
                overlayColor: WidgetStatePropertyAll(AppColors.transparent),
                child: Center(
                  child: DotIndicator(
                    color: getIndicatorColor(context, currentStep > 0),
                    border: Border.all(color: getColor(context, currentStep >= 0)),
                    child: getIndicator(context, 0),
                  ),
                ),
              ),
              endConnector: SolidLineConnector(color: getColor(context, currentStep > 0)),
            ),
            contents: getText(context, currentStep >= 0, 0),
          ),
      
          TimelineTile(
            node: TimelineNode(
              indicator: InkWell(
                onTap: () {onStepTap(1);},
                overlayColor: WidgetStatePropertyAll(AppColors.transparent),
                child: Center(
                  child: DotIndicator(
                    color: getIndicatorColor(context, currentStep > 1),
                    border: Border.all(color: getColor(context, currentStep >= 1)),
                    child: getIndicator(context, 1),
                  ),
                ),
              ),
              startConnector: SolidLineConnector(color: getColor(context, currentStep > 0)),
              endConnector: SolidLineConnector(color: getColor(context, currentStep > 1)),
            ),
            contents: getText(context, currentStep >= 1, 1),
          ),
      
          TimelineTile(
            node: TimelineNode(
              indicator: InkWell(
                onTap: () {onStepTap(2);},
                overlayColor: WidgetStatePropertyAll(AppColors.transparent),
                child: Center(
                  child: DotIndicator(
                    color: getIndicatorColor(context, currentStep > 2),
                    border: Border.all(color: getColor(context, currentStep >= 2)),
                    child: getIndicator(context, 2),
                  ),
                ),
              ),
              startConnector: SolidLineConnector(color: getColor(context, currentStep > 1)),
              endConnector: SolidLineConnector(color: getColor(context, currentStep > 2)),
            ),
            contents: getText(context, currentStep >= 2, 2),
          ),
      
          TimelineTile(
            node: TimelineNode(
              indicator: InkWell(
                onTap: () {onStepTap(3);},
                overlayColor: WidgetStatePropertyAll(AppColors.transparent),
                child: Center(
                  child: DotIndicator(
                    color: getIndicatorColor(context, currentStep > 3),
                    border: Border.all(color: getColor(context, currentStep >= 3)),
                    child: getIndicator(context, 3),
                  ),
                ),
              ),
              startConnector: SolidLineConnector(color: getColor(context, currentStep > 2)),
            ),
            contents: getText(context, currentStep >= 3, 3),
          ),
      
        ],
      ),
    );
  }
}