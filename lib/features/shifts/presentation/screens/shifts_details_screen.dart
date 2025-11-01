import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/injection/injection_container.dart';
import 'package:stat_doctor/core/navigation/app_navigator.dart';
import 'package:stat_doctor/core/widgets/app_appbar.dart';
import 'package:stat_doctor/core/widgets/app_button.dart';
import 'package:stat_doctor/features/home/data/models/home_shift_model.dart';
import 'package:stat_doctor/features/home/data/models/shift_day_vo.dart';
import 'package:stat_doctor/features/home/presentation/cubit/home_cubit.dart';
import 'package:stat_doctor/features/hospital/presentation/screens/hospital_screen.dart';
import 'package:stat_doctor/features/shifts/presentation/widgets/my_shifts_details_contact.dart';
import 'package:stat_doctor/features/shifts/presentation/widgets/my_shifts_details_description.dart';
import 'package:stat_doctor/features/shifts/presentation/widgets/my_shifts_details_info.dart';
import 'package:stat_doctor/features/shifts/presentation/widgets/my_shifts_details_requirements.dart';
import 'package:stat_doctor/features/shifts/presentation/widgets/my_shifts_details_similar_shifts.dart';

class ShiftsDetailsScreen extends StatefulWidget {
  final HomeShiftModel homeShiftModel;
  const ShiftsDetailsScreen({required this.homeShiftModel, super.key});
  @override
  State<ShiftsDetailsScreen> createState() => _ShiftsDetailsScreenState();
}

class _ShiftsDetailsScreenState extends State<ShiftsDetailsScreen> {
  final List<ShiftDayVO> selectedShiftsDaysVOList = [];

  String get buttonApplytitle => selectedShiftsDaysVOList.isNotEmpty ? "Apply (${selectedShiftsDaysVOList.length} ${selectedShiftsDaysVOList.length > 1 ? "shifts" : "shift"})" : "Apply";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h, bottom: 30.h),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 10.h,
          children: [
            AppButton(
              onTap: () {
              },
              text: buttonApplytitle,
            ),
          ],
        ),
      ),
      appBar: AppAppbar(title: Text("Shift Detials")),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h, bottom: 30.h),
        child: Column(
          spacing: 15.h,
          children: [
            MyShiftsDetailsInfo(
              onTap: () {sl<AppNavigator>().push(screen: BlocProvider.value(
                value: context.read<HomeCubit>(),
                child: HospitalScreen(homeShiftModel: widget.homeShiftModel,),
              ));},
              homeShiftModel: widget.homeShiftModel,
            ),
            if(widget.homeShiftModel.shiftsDetailVO.shiftsDescription?.isNotEmpty ?? false)
            MyShiftsDetailsDescription(description: widget.homeShiftModel.shiftsDetailVO.shiftsDescription ?? "",),
            MyShiftsDetailsRequirements(shiftsDetailVO: widget.homeShiftModel.shiftsDetailVO,),
            MyShiftsDetailsContact(homeShiftModel: widget.homeShiftModel,),
            MyShiftsDetailsSimilarShifts(
              homeShiftModel: widget.homeShiftModel,
              selectedShiftsDaysVOList: selectedShiftsDaysVOList,
              onSelected: (shift) {
                setState(() {
                  selectedShiftsDaysVOList.contains(shift)?
                  selectedShiftsDaysVOList.remove(shift):
                  selectedShiftsDaysVOList.add(shift);
                });
              },
            ),
          ],
        ),
      )
    );
  }
}