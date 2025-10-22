import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelines_plus/timelines_plus.dart';

class TimeLineTheme {
  static TimelineThemeData timelineThemeData(BuildContext context) => TimelineThemeData(
    direction: Axis.horizontal,
    indicatorTheme: IndicatorThemeData(size: 20.r, position: 0, color: Theme.of(context).dividerColor,),
    connectorTheme: ConnectorThemeData(thickness: 2, color: Theme.of(context).dividerColor, space: 20.w),
  );
}