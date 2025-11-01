import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/app_button.dart';
import 'package:stat_doctor/core/widgets/popup_header.dart';
import 'package:stat_doctor/features/home/data/objects_value/shift_status_params.dart';

class HomeShiftLocationBottomSheet extends StatefulWidget {
  final ShiftStatusParams currentShiftsStatus;
  final Function(ShiftStatusParams) onShiftsStatusChanged;
  const HomeShiftLocationBottomSheet({super.key, required this.currentShiftsStatus, required this.onShiftsStatusChanged});
  @override
  State<HomeShiftLocationBottomSheet> createState() => _HomeShiftLocationBottomSheetState();
}

class _HomeShiftLocationBottomSheetState extends State<HomeShiftLocationBottomSheet> {
  ShiftStatusParams selectedShiftsStatus = ShiftStatusParams.shiftStatusList.first;
  
  @override
  void initState() {
    super.initState();
    selectedShiftsStatus = widget.currentShiftsStatus;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w, bottom: 25.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 15.h,
        children: [
          PopupHeader(title: "Shifts near you",),
          ...List.generate(
            ShiftStatusParams.shiftStatusList.length,
            (index) => AppButton(
              onTap: () {setState(() {selectedShiftsStatus = ShiftStatusParams.shiftStatusList[index];});},
              color: selectedShiftsStatus == ShiftStatusParams.shiftStatusList[index] ? Theme.of(context).primaryColor.withValues(alpha: 0.1) : Theme.of(context).cardColor,
              borderColor: selectedShiftsStatus == ShiftStatusParams.shiftStatusList[index] ? Theme.of(context).primaryColor : Theme.of(context).dividerColor,
              style: TextStyles.textViewMedium14.copyWith(color: selectedShiftsStatus == ShiftStatusParams.shiftStatusList[index] ? Theme.of(context).primaryColor : Theme.of(context).colorScheme.onSurface),
              text: ShiftStatusParams.shiftStatusList[index].title,
            )
          ),
          AppButton(
            onTap: () {
              Navigator.pop(context);
              if(selectedShiftsStatus != widget.currentShiftsStatus) {
                widget.onShiftsStatusChanged(selectedShiftsStatus);
              }
            },
            margin: EdgeInsets.symmetric(vertical: 10.h),
            text: "Select",
          )
        ],
      ),
    );
  }
}