import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTabBar extends StatelessWidget {
  final List<String> tabItems;
  final ValueChanged<int?>? onTab;
  final int? selectedIndex;
  final EdgeInsetsGeometry? padding;

  const AppTabBar({
    super.key,
    required this.tabItems,
    this.onTab,
    this.selectedIndex,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: padding ?? EdgeInsets.symmetric(horizontal: 25.w),
        separatorBuilder: (context, index) => SizedBox(width: 10.w),
        itemCount: tabItems.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {if (onTab != null) {onTab!(selectedIndex == index ? null : index);}},
          child: Container(
            height: 35.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: selectedIndex == index ? Theme.of(context).primaryColor.withValues(alpha: .2) : Theme.of(context).cardColor, borderRadius: BorderRadius.all(Radius.circular(10.r)),
              border: Border.all(color: selectedIndex == index ? Theme.of(context).primaryColor : Theme.of(context).cardColor,),
            ),
            child: Text(
              tabItems[index],
              style: TextStyles.textViewRegular12.copyWith(color: Theme.of(context).primaryColor,),
            ),
          ),
        ),
      ),
    );
  }
}
