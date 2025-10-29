import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/injection/injection_container.dart';
import 'package:stat_doctor/core/navigation/app_navigator.dart';
import 'package:stat_doctor/core/widgets/align_text.dart';
import 'package:stat_doctor/core/widgets/app_appbar.dart';
import 'package:stat_doctor/core/widgets/app_button.dart';
import 'package:stat_doctor/core/widgets/app_dropdown.dart';
import 'package:stat_doctor/core/widgets/clickable_text.dart';
import 'package:stat_doctor/features/home/data/objects_value/filter_params.dart';
import 'package:stat_doctor/features/home/presentation/widgets/filter_available_shifts.dart';
import 'package:stat_doctor/features/home/presentation/widgets/home_filter_calendar.dart';
import 'package:stat_doctor/features/options/presentation/cubit/options_cubit.dart';

class HomeFilterScreen extends StatefulWidget {
  final FilterParams filterParams;
  final Function(FilterParams) onFilterParamsChanged;
  const HomeFilterScreen({super.key, required this.filterParams, required this.onFilterParamsChanged});
  @override
  State<HomeFilterScreen> createState() => _HomeFilterScreenState();
}

class _HomeFilterScreenState extends State<HomeFilterScreen> {
  List<String> availableShifts = ["Morning", "Evening", "Night", "Bridging"];
  FilterParams filterParams = FilterParams();
  

  @override
  void initState() {
    filterParams = widget.filterParams;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(title: Text("Filter")),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 25.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AlignText(
              text: "Avaliable days",
              style: TextStyles.textViewBold16,
              padding: EdgeInsetsDirectional.only(start: 5.w, bottom: 10.h),
            ),
            HomeFilterCalendar(
              selectedDates: filterParams.selectedDates,
              onSelectedDatesChanged: (dates) {setState(() {filterParams = filterParams.copyWith(selectedDates: dates);});},
            ),
            AlignText(
              text: "Available shifts",
              style: TextStyles.textViewBold16,
              padding: EdgeInsetsDirectional.only(start: 5.w, top: 15.h, bottom: 10.h),
            ),
            FilterAvailableShifts(
              availableShifts: availableShifts,
              onShiftSelected: (index) {
                setState(() {
                  filterParams = filterParams.copyWith(selectedShiftIndex: index);
                });
              },
              selectedShift: filterParams.selectedShiftIndex,
            ),
            AlignText(
              text: "Distance from current location",
              style: TextStyles.textViewBold16,
              padding: EdgeInsetsDirectional.only(start: 5.w, top: 15.h, bottom: 10.h),
            ),
            Slider(
              value: (filterParams.distanceValue ?? 0) / 100,
              onChanged: (value) {
                setState(() {
                  filterParams = filterParams.copyWith(distanceValue: value * 100);
                  log(filterParams.distanceValue.toString());
                });
              },
              inactiveColor: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1),
              padding: EdgeInsets.symmetric(horizontal: 5.w),
            ),
            AlignText(
              text: "Specialty",
              style: TextStyles.textViewMedium14,
              padding: EdgeInsetsDirectional.only(start: 5.w, top: 15.h, bottom: 5.h),
            ),
            AppDropdown(
              items: context.read<OptionsCubit>().specialtiesOptions.map((e) => e.name).toList(),
              initialItem: filterParams.selectedSpecialty?.name,
              hintText: "Select...",
              onChanged: (value) {
                if(value != null) {
                  setState(() {
                    filterParams = filterParams.copyWith(
                      selectedSpecialty: context.read<OptionsCubit>().specialtiesOptions.firstWhere((e) => e.name == value)
                    );
                  });
                }
              },
            ),
            AlignText(
              text: "Skill level",
              style: TextStyles.textViewMedium14,
              padding: EdgeInsetsDirectional.only(start: 5.w, top: 15.h, bottom: 5.h),
            ),
            AppDropdown(
              items: context.read<OptionsCubit>().skillOptions.map((e) => e.name).toList(),
              initialItem: filterParams.selectedSkill?.name,
              hintText: "Select...",
              onChanged: (value) {
                if(value != null) {
                  setState(() {
                    filterParams = filterParams.copyWith(
                      selectedSkill: context.read<OptionsCubit>().skillOptions.firstWhere((e) => e.name == value)
                    );
                  });
                }
              },
            ),
            AppButton(
              onTap: () {widget.onFilterParamsChanged(filterParams); sl<AppNavigator>().pop();},
              margin: EdgeInsets.only(top: 20.h, bottom: 10.h),
              text: "Apply",
            ),
            Center(
              child: ClickableText(
                text: "Reset",
                textStyle: TextStyles.textViewMedium16.copyWith(color: Theme.of(context).hintColor),
                onTap: () {widget.onFilterParamsChanged(FilterParams()); sl<AppNavigator>().pop();},
              ),
            )
          ],
        ),
      ),
    );
  }
}