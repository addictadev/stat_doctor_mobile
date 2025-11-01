import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/align_text.dart';
import 'package:stat_doctor/core/widgets/app_shimmer.dart';
import 'package:stat_doctor/core/widgets/custom_loading.dart';
import 'package:stat_doctor/core/widgets/shimmer_shape.dart';
import 'package:stat_doctor/features/home/presentation/cubit/home_cubit.dart';
import 'package:stat_doctor/features/home/presentation/widgets/home_hospital_card.dart';

class HomeWorkedHospitals extends StatelessWidget {
  final ScrollController workedScrollController;
  const HomeWorkedHospitals({super.key, required this.workedScrollController});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          AlignText(
            text: "Hospital you’ve worked at",
            style: TextStyles.textViewBold18,
            padding: EdgeInsets.only(left: 25.w, right: 20.w, top: 20.h, bottom: 10.h),
          ),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if(state is GetHomeShiftsLoading || state is GetHomeShiftsFailure) {return AppShimmer(child: ShimmerShape(width: MediaQuery.sizeOf(context).width * 0.8, height: MediaQuery.sizeOf(context).height * 0.4, radius: 20.r,));} 
              return SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.57,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  controller: workedScrollController,
                  itemCount: context.read<HomeCubit>().workedList.length + (state is GetMoreWorkedHomeShiftsLoading ? 1 : 0),
                  separatorBuilder: (context, index) => SizedBox(width: 10.w),
                  itemBuilder: (context, index) {
                    if (index == context.read<HomeCubit>().workedList.length) {return CustomLoading();}
                    return HomeHospitalCard(homeShiftModel: context.read<HomeCubit>().workedList[index]);
                  } ,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}