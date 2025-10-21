import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/app_button.dart';
import 'package:stat_doctor/core/widgets/popup_header.dart';

class HomeShiftLocationBottomSheet extends StatefulWidget {
  final List<String> shiftsLocationsTitles;
  final int shiftsLocationsIndex;
  final Function(int) onShiftsLocationsChanged;
  const HomeShiftLocationBottomSheet({super.key, required this.shiftsLocationsTitles, required this.shiftsLocationsIndex, required this.onShiftsLocationsChanged});
  @override
  State<HomeShiftLocationBottomSheet> createState() => _HomeShiftLocationBottomSheetState();
}

class _HomeShiftLocationBottomSheetState extends State<HomeShiftLocationBottomSheet> {
  int selectedShiftsLocationsIndex = 0;
  
  @override
  void initState() {
    super.initState();
    selectedShiftsLocationsIndex = widget.shiftsLocationsIndex;
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
            widget.shiftsLocationsTitles.length,
            (index) => AppButton(
              onTap: () {setState(() {selectedShiftsLocationsIndex = index;});},
              color: selectedShiftsLocationsIndex == index ? Theme.of(context).primaryColor.withValues(alpha: 0.1) : Theme.of(context).cardColor,
              borderColor: selectedShiftsLocationsIndex == index ? Theme.of(context).primaryColor : Theme.of(context).dividerColor,
              style: TextStyles.textViewMedium14.copyWith(color: selectedShiftsLocationsIndex == index ? Theme.of(context).primaryColor : Theme.of(context).colorScheme.onSurface),
              text: widget.shiftsLocationsTitles[index],
            )
          ),
          AppButton(
            onTap: () {
              Navigator.pop(context);
              if(selectedShiftsLocationsIndex != widget.shiftsLocationsIndex) {
                widget.onShiftsLocationsChanged(selectedShiftsLocationsIndex);
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