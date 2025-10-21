import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/app_button.dart';
import 'package:stat_doctor/core/widgets/custom_popup.dart';
import 'package:stat_doctor/core/widgets/tab_selector.dart';
import 'package:stat_doctor/features/home/presentation/widgets/home_shift_location_bottom_sheet.dart';

class HomeOtherShiftsFilter extends StatelessWidget {
  final List<String> otherShiftsTitles;
  final int otherShiftsIndex;
  final Function(int) onOtherShiftsChanged;
  final List<String> shiftsLocationsTitles;
  final int shiftsLocationsIndex;
  final Function(int) onShiftsLocationsChanged;

  const HomeOtherShiftsFilter({
    super.key,
    required this.otherShiftsTitles,
    required this.otherShiftsIndex,
    required this.onOtherShiftsChanged,
    required this.shiftsLocationsTitles,
    required this.shiftsLocationsIndex,
    required this.onShiftsLocationsChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        spacing: 15.h,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 20.w, top: 20.h,),
            child: Row(
              children: [
                Expanded(child: Text("Other Shifts", style: TextStyles.textViewBold18,)),
                AppButton(
                  onTap: () {
                    CustomPopup.appShowModalBottomSheet(
                      context: context,
                      builder: (ctx) => HomeShiftLocationBottomSheet(
                        shiftsLocationsTitles: shiftsLocationsTitles,
                        shiftsLocationsIndex: shiftsLocationsIndex,
                        onShiftsLocationsChanged: onShiftsLocationsChanged,
                      ),
                    );
                  },
                  flexableWidth: true,
                  color: Theme.of(context).cardColor,
                  borderColor: Theme.of(context).dividerColor,
                  padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                  child: Row(
                    spacing: 5.w,
                    children: [
                      Text(shiftsLocationsTitles[shiftsLocationsIndex], style: TextStyles.textViewMedium13.copyWith(color: Theme.of(context).primaryColor),),
                      Icon(Icons.keyboard_arrow_down_rounded, size: 20.r, color: Theme.of(context).primaryColor,),
                    ],
                  ),
                ),
              ],
            ),
          ),
          TabSelector(
            height: 40.h,
            viewBorder: false,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            titles: otherShiftsTitles,
            currentIndex: otherShiftsIndex,
            onIndexChanged: onOtherShiftsChanged
          )
        ],
      ),
    );
  }
}