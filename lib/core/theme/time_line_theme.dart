import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelines_plus/timelines_plus.dart';

class TimeLineTheme {
  static TimelineThemeData timelineThemeData(BuildContext context) => TimelineThemeData(
    nodePosition: 0,
    indicatorTheme: IndicatorThemeData(size: 20.r, position: 0, color: Theme.of(context).dividerColor,),
    connectorTheme: ConnectorThemeData(thickness: 2, indent: 5, color: Theme.of(context).dividerColor,),
  );
}