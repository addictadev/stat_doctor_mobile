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

class HomeInterestedShifts extends StatelessWidget {
  final ScrollController interestedScrollController;
  const HomeInterestedShifts({
    super.key,
    required this.interestedScrollController,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          AlignText(
            text: "Shifts you might be interested in",
            style: TextStyles.textViewBold18,
            padding: EdgeInsets.only(
              left: 25.w,
              right: 20.w,
              top: 20.h,
              bottom: 10.h,
            ),
          ),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if(state is GetHomeShiftsLoading || state is GetHomeShiftsFailure) {return AppShimmer(child: ShimmerShape(width: MediaQuery.sizeOf(context).width * 0.8, height: MediaQuery.sizeOf(context).height * 0.4, radius: 20.r,));} 
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                controller: interestedScrollController,
                child: Row(
                  spacing: 10.w,
                  children: List.generate(context.read<HomeCubit>().interestedList.length + (state is GetMoreInterestedHomeShiftsLoading ? 1 : 0), (index) {
                    if (index == context.read<HomeCubit>().interestedList.length) {return CustomLoading();}
                    return HomeHospitalCard(homeShiftModel: context.read<HomeCubit>().interestedList[index]);
                  }),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
