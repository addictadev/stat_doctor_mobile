import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/widgets/app_appbar.dart';
import 'package:stat_doctor/core/widgets/app_cached_network_image.dart';
import 'package:stat_doctor/core/widgets/tab_selector.dart';
import 'package:stat_doctor/features/home/data/models/home_shift_model.dart';
import 'package:stat_doctor/features/hospital/presentation/screens/hospital_description.dart';
import 'package:stat_doctor/features/hospital/presentation/screens/hospital_shifts.dart';
import 'package:stat_doctor/features/hospital/presentation/widgets/hospital_fav_button.dart';
import 'package:stat_doctor/features/hospital/presentation/widgets/hospital_info.dart';

class HospitalScreen extends StatefulWidget {
  final HomeShiftModel homeShiftModel;
  const HospitalScreen({required this.homeShiftModel, super.key});
  @override
  State<HospitalScreen> createState() => _HospitalScreenState();
}

class _HospitalScreenState extends State<HospitalScreen> {
  int currentIndex = 0;

  void _onIndexChanged(int index) {
    setState(() {currentIndex = index;});
  }

  List<Widget> get _getTabs => [
    HospitalDescription(description: widget.homeShiftModel.hospitalVO.hospitalDescription,),
    HospitalShifts(homeShiftModel: widget.homeShiftModel,),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppAppbar(
        backgroundColor: AppColors.transparent,
        backButtonBackgroundColor: AppColors.textColorLight.withValues(alpha: 0.1),
        backButtonIconColor: AppColors.cardColorLight,
        actions: [HospitalFavButton(isFav: widget.homeShiftModel.hospitalVO.favouritesFlag),],
      ),
      body: Stack(
        children: [
          Column(children: [AppCachedNetworkImage(imageUrl: widget.homeShiftModel.hospitalVO.hospitalImage, width: double.infinity, height: MediaQuery.sizeOf(context).height * 0.3,),],),
          Positioned.fill(
            child: Container(
              margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.25),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
              ),
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverToBoxAdapter(child: HospitalInfo(homeShiftModel: widget.homeShiftModel,)),
                ],
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TabSelector(
                      margin: EdgeInsets.symmetric(vertical: 15.h),
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      titles: ["Description", "Hospital Shifts"],
                      currentIndex: currentIndex,
                      onIndexChanged: _onIndexChanged,
                      selectedColor: AppColors.green.withValues(alpha: 0.1),
                      selectedTextColor: AppColors.green,
                      selectedBorderColor: AppColors.green,
                      unselectedColor: Theme.of(context).cardColor,
                    ),
                    Expanded(child: _getTabs[currentIndex],)
                  ],
                ),
              )
            )
          )
        ],
      )
    );
  }
}