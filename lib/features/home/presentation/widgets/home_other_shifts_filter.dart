import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/app_button.dart';
import 'package:stat_doctor/core/widgets/custom_popup.dart';
import 'package:stat_doctor/core/widgets/tab_selector.dart';
import 'package:stat_doctor/features/home/data/objects_value/filter_params.dart';
import 'package:stat_doctor/features/home/data/objects_value/shift_status_params.dart';
import 'package:stat_doctor/features/home/presentation/cubit/filter_cubit.dart';
import 'package:stat_doctor/features/home/presentation/widgets/home_shift_location_bottom_sheet.dart';

class HomeOtherShiftsFilter extends StatelessWidget {
  final FilterParams filterParams;
  final ShiftStatusParams currentShiftsStatus;
  final Function(ShiftStatusParams) onShiftsStatusChanged;
  final Function(String) onShiftChanged;
  

  const HomeOtherShiftsFilter({
    super.key,
    required this.filterParams,
    required this.currentShiftsStatus,
    required this.onShiftsStatusChanged,
    required this.onShiftChanged,
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
                        currentShiftsStatus: currentShiftsStatus,
                        onShiftsStatusChanged: onShiftsStatusChanged,
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
                      Text(currentShiftsStatus.title, style: TextStyles.textViewMedium13.copyWith(color: Theme.of(context).primaryColor),),
                      Icon(Icons.keyboard_arrow_down_rounded, size: 20.r, color: Theme.of(context).primaryColor,),
                    ],
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<FilterCubit, FilterState>(
            builder: (context, state) {
              return TabSelector(
                height: 40.h,
                viewBorder: false,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                titles: context.read<FilterCubit>().homeFilterModel.timeType,
                currentIndex: context.read<FilterCubit>().homeFilterModel.timeType.indexOf(filterParams.selectedShift),
                onIndexChanged: (index){onShiftChanged(context.read<FilterCubit>().homeFilterModel.timeType[index]);}
              );
            },
          )
        ],
      ),
    );
  }
}