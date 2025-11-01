import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/widgets/app_shimmer.dart';
import 'package:stat_doctor/core/widgets/shimmer_shape.dart';
import 'package:stat_doctor/features/home/presentation/cubit/home_cubit.dart';
import 'package:stat_doctor/features/home/presentation/widgets/home_grid_loading.dart';
import 'package:stat_doctor/features/home/presentation/widgets/home_other_shifts_card.dart';
import 'package:stat_doctor/features/home/presentation/widgets/no_home_data.dart';

class HomeOtherShiftsGridView extends StatelessWidget {
  const HomeOtherShiftsGridView({super.key,});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      sliver: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if(state is GetHomeShiftsLoading || state is GetHomeShiftsFailure) {return HomeGridLoading();} 
          if(context.read<HomeCubit>().nearList.isEmpty) {return SliverToBoxAdapter(child: NoHomeData(margin: EdgeInsets.zero));}
          return SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              mainAxisSpacing: 10.h,
              crossAxisSpacing: 10.w,
            ),
            itemCount: context.read<HomeCubit>().nearList.length + (state is GetMoreNearHomeShiftsLoading ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == context.read<HomeCubit>().nearList.length) {return AppShimmer(child: ShimmerShape(width: double.infinity, height: double.infinity, radius: 15.r,));}
              return HomeOtherShiftsCard(homeShiftModel: context.read<HomeCubit>().nearList[index]);
            },
          );
        },
      ),
    );
  }
}
