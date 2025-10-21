import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/features/home/presentation/widgets/home_header.dart';
import 'package:stat_doctor/features/home/presentation/widgets/home_interested_shifts.dart';
import 'package:stat_doctor/features/home/presentation/widgets/home_other_shifts_filter.dart';
import 'package:stat_doctor/features/home/presentation/widgets/home_other_shifts_grid_view.dart';
import 'package:stat_doctor/features/home/presentation/widgets/home_worked_hospitals.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  int otherShiftsIndex = 0;
  int shiftsLocationsIndex = 0;
  List<String> otherShiftsTitles = ["All", "Morning", "Evening", "Night", "Bridging"];
  List<String> shiftsLocationsTitles = ["Closest to me", "Maximum rate"];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          HomeHeader(searchController: searchController,),
          HomeWorkedHospitals(),
          HomeInterestedShifts(),
          HomeOtherShiftsFilter(
            otherShiftsTitles: otherShiftsTitles,
            otherShiftsIndex: otherShiftsIndex,
            onOtherShiftsChanged: (index) {setState(() {otherShiftsIndex = index;});},
            shiftsLocationsTitles: shiftsLocationsTitles,
            shiftsLocationsIndex: shiftsLocationsIndex,
            onShiftsLocationsChanged: (index) {setState(() {shiftsLocationsIndex = index;});},
          ),
          HomeOtherShiftsGridView(),
          SliverToBoxAdapter(child: SizedBox(height: 125.h,),)
        ],
      ),
    );
  }
}