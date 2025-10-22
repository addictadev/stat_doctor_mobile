import 'package:flutter/material.dart';
import 'package:stat_doctor/features/shifts/presentation/widgets/my_shifts_appbar.dart';
import 'package:stat_doctor/features/shifts/presentation/widgets/select_my_shifts_status.dart';

class MyShiftsScreen extends StatefulWidget {
  const MyShiftsScreen({super.key});
  @override
  State<MyShiftsScreen> createState() => _MyShiftsScreenState();
}

class _MyShiftsScreenState extends State<MyShiftsScreen> {
  List<String> myShiftsTypeTitles = ["Upcoming", "Past",];
  List<String> myShiftsStatusTitles = ["All", "Applied", "Accepted"];
  int myShiftsTypeIndex = 0;
  int myShiftsStatusIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyShiftsAppbar(
        shiftTypes: myShiftsTypeTitles,
        currentShiftTypeIndex: myShiftsTypeIndex,
        onShiftTypeChanged: (index) {setState(() {myShiftsTypeIndex = index;});},
      ),
      body: CustomScrollView(
        slivers: [
          SelectMyShiftsStatus(
            shiftStatuses: myShiftsStatusTitles,
            currentShiftStatusIndex: myShiftsStatusIndex,
            onShiftStatusChanged: (index) {setState(() {myShiftsStatusIndex = index;});},
          ),
        ],
      ),
    );
  }
}