import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/injection/injection_container.dart';
import 'package:stat_doctor/core/navigation/app_navigator.dart';
import 'package:stat_doctor/features/home/data/models/home_shift_model.dart';
import 'package:stat_doctor/features/home/presentation/cubit/home_cubit.dart';
import 'package:stat_doctor/features/home/presentation/widgets/home_hospital_card_buttons.dart';
import 'package:stat_doctor/features/home/presentation/widgets/home_hospital_card_image.dart';
import 'package:stat_doctor/features/home/presentation/widgets/home_hospital_card_rate.dart';
import 'package:stat_doctor/features/home/presentation/widgets/home_hospital_info_item.dart';
import 'package:stat_doctor/features/hospital/presentation/screens/hospital_screen.dart';
import 'package:stat_doctor/features/shifts/presentation/screens/shifts_details_screen.dart';

class HomeHospitalCard extends StatelessWidget {
  final bool toHospitalScreen;
  final HomeShiftModel homeShiftModel;
  const HomeHospitalCard({super.key, required this.homeShiftModel, required this.toHospitalScreen});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {sl<AppNavigator>().push(
        screen: BlocProvider.value(
          value: context.read<HomeCubit>(),
          child: toHospitalScreen ? HospitalScreen(homeShiftModel: homeShiftModel) : ShiftsDetailsScreen(homeShiftModel: homeShiftModel),
        )
      );},
      overlayColor: WidgetStatePropertyAll(AppColors.transparent),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.8,
        padding: EdgeInsets.all(15.r),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          border: Border.all(color: Theme.of(context).dividerColor),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 15.h,
          children: [
            HomeHospitalCardImage(homeShiftModel: homeShiftModel),
            Text(homeShiftModel.hospitalVO.hospitalName, style: TextStyles.textViewBold16, maxLines: 2, overflow: TextOverflow.ellipsis,),
            HomeHospitalCardRate(homeShiftModel: homeShiftModel),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 15.h,
              children: [
                HomeHospitalInfoItem(title: "Min. skill level: ", value: homeShiftModel.shiftsDetailVO.skillLevel),
                HomeHospitalInfoItem(title: "Specialty: ", value: homeShiftModel.shiftsDetailVO.specialty),
                HomeHospitalInfoItem(title: "Support level: ", value: homeShiftModel.shiftsDetailVO.supportLevel),
              ],
            ),
            HomeHospitalCardButtons(homeShiftModel: homeShiftModel),
          ],
        ),
      ),
    );
  }
}