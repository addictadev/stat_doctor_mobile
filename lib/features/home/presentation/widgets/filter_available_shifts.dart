import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/features/home/presentation/widgets/available_shift_button.dart';


class FilterAvailableShifts extends StatelessWidget {
  final List<String> availableShifts;
  final Function(int) onShiftSelected;
  final int? selectedShift;
  const FilterAvailableShifts({super.key, required this.availableShifts, required this.onShiftSelected, required this.selectedShift});

  bool isSelected(int index) => selectedShift == index;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      children: [
        Row(
          spacing: 10.w,
          children: [
            Expanded(
              child: AvailableShiftButton(
                onTap: () {onShiftSelected(0);},
                text: availableShifts[0],
                isSelected: selectedShift == 0,
              )
            ),
            Expanded(
              child: AvailableShiftButton(
                onTap: () {onShiftSelected(1);},
                text: availableShifts[1],
                isSelected: selectedShift == 1,
              )
            )
          ],
        ),
        Row(
          spacing: 10.w,
          children: [
            Expanded(
              child: AvailableShiftButton(
                onTap: () {onShiftSelected(2);},
                text: availableShifts[2],
                isSelected: selectedShift == 2,
              )
            ),
            Expanded(
              child: AvailableShiftButton(
                onTap: () {onShiftSelected(3);},
                text: availableShifts[3],
                isSelected: selectedShift == 3,
              )
            )
          ],
        )

      ],
    );
  }
}