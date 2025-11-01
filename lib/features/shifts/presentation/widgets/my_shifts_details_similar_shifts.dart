import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/badge.dart';
import 'package:stat_doctor/core/widgets/default_container.dart';
import 'package:stat_doctor/features/home/data/models/home_shift_model.dart';
import 'package:stat_doctor/features/home/data/models/shift_day_vo.dart';
import 'package:stat_doctor/features/shifts/presentation/widgets/similar_shift_item.dart';

class MyShiftsDetailsSimilarShifts extends StatefulWidget {
  final HomeShiftModel homeShiftModel;
  final List<ShiftDayVO> selectedShiftsDaysVOList;
  final Function(ShiftDayVO) onSelected;
  const MyShiftsDetailsSimilarShifts({required this.homeShiftModel, required this.selectedShiftsDaysVOList, required this.onSelected, super.key});

  @override
  State<MyShiftsDetailsSimilarShifts> createState() => _MyShiftsDetailsSimilarShiftsState();
}

class _MyShiftsDetailsSimilarShiftsState extends State<MyShiftsDetailsSimilarShifts> {
  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      child: Column(
        spacing: 15.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text("Similar shifts available", style: TextStyles.textViewBold16,),),
              AppBadge(
                color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                textColor: Theme.of(context).colorScheme.onSurface,
                title: "Group (${widget.homeShiftModel.shiftsDaysVOList.length})",
              )
            ],
          ),
          Text(
            "Similar shifts only differ in date & rate. Select as many from this group as you’d like to apply for. View hospital details for all their available shifts.",
            style: TextStyles.textViewRegular14
          ),
          Column(
            spacing: 10.h,
            children: List.generate(widget.homeShiftModel.shiftsDaysVOList.length, (index) => SimilarShiftItem(
              shift: widget.homeShiftModel.shiftsDaysVOList[index],
              selected: widget.selectedShiftsDaysVOList.contains(widget.homeShiftModel.shiftsDaysVOList[index]),
              onTap: () {widget.onSelected(widget.homeShiftModel.shiftsDaysVOList[index]); },
            )),
          ),
        ],
      ),
    );
  }

}
