import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTabBarTab extends StatelessWidget {
  final List<Tab> tabs;
  final EdgeInsetsGeometry indicatorPadding;
  final bool isScrollable;
  final TabAlignment? tabAlignment;
  const AppTabBarTab({super.key, required this.tabs, this.indicatorPadding = EdgeInsets.zero, this.isScrollable = true, this.tabAlignment});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: isScrollable,
      tabAlignment: tabAlignment ?? TabAlignment.center,
      overlayColor: WidgetStatePropertyAll(AppColors.transparent),
      dividerColor: Theme.of(context).cardColor,
      dividerHeight: 2.5.r,
      labelPadding: EdgeInsets.symmetric(horizontal: 25.w),
      indicatorPadding: indicatorPadding,
      unselectedLabelColor: Theme.of(context).hintColor,
      labelStyle: TextStyles.textViewSemiBold13,
      unselectedLabelStyle: TextStyles.textViewMedium12,
      labelColor: Theme.of(context).primaryColor,
      indicator: UnderlineTabIndicator(borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2.5.r,),),
      tabs: tabs,
    );
  }
}