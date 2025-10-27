import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/badge.dart';
import 'package:stat_doctor/core/widgets/default_container.dart';
import 'package:stat_doctor/features/shifts/data/model/similar_shift_model.dart';
import 'package:stat_doctor/features/shifts/presentation/widgets/similar_shift_item.dart';

class MyShiftsDetailsSimilarShifts extends StatefulWidget {
  const MyShiftsDetailsSimilarShifts({super.key});

  @override
  State<MyShiftsDetailsSimilarShifts> createState() => _MyShiftsDetailsSimilarShiftsState();
}

class _MyShiftsDetailsSimilarShiftsState extends State<MyShiftsDetailsSimilarShifts> {
  final List<SimilarShift> similarShifts = [
    SimilarShift(date: "Wed, 01 Nov 2022", rate: "\$200/hr"),
    SimilarShift(date: "Wed, 01 Nov 2022", rate: "\$250/hr"),
    SimilarShift(date: "Wed, 01 Nov 2022", rate: "\$300/hr"),
    SimilarShift(date: "Wed, 01 Nov 2022", rate: "\$350/hr"),
  ];

  List<SimilarShift> selectedShifts = [];

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
                title: "Group (4)",
              )
            ],
          ),
          Text(
            "Similar shifts only differ in date & rate. Select as many from this group as you’d like to apply for. View hospital details for all their available shifts.",
            style: TextStyles.textViewRegular14
          ),
          Column(
            spacing: 10.h,
            children: List.generate(4, (index) => SimilarShiftItem(
              shift: similarShifts[index],
              selected: selectedShifts.contains(similarShifts[index]),
              onTap: () {
                if(selectedShifts.contains(similarShifts[index])) {
                  setState(() {selectedShifts.remove(similarShifts[index]);});
                } else {
                  setState(() {selectedShifts.add(similarShifts[index]);});
                }
              },
            )),
          ),
        ],
      ),
    );
  }

}
