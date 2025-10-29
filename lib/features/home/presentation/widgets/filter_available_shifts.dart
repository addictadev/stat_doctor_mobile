import 'package:flutter/material.dart';
import 'package:stat_doctor/features/home/presentation/widgets/available_shift_button.dart';


class FilterAvailableShifts extends StatelessWidget {
  final List<String> availableShifts;
  final Function(String) onShiftSelected;
  final String? selectedShift;
  const FilterAvailableShifts({super.key, required this.availableShifts, required this.onShiftSelected, required this.selectedShift});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) => AvailableShiftButton(
        onTap: () {onShiftSelected(availableShifts[index]);},
        text: availableShifts[index],
        isSelected: selectedShift == availableShifts[index],
      ),
    );
  }
}