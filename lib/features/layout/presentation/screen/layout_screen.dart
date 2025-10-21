import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/injection/injection_container.dart';
import 'package:stat_doctor/features/home/presentation/screens/home_screen.dart';
import 'package:stat_doctor/features/layout/presentation/cubit/bnb_cubit.dart';
import 'package:stat_doctor/features/layout/presentation/widget/bnb_icon.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});
  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  late final List<Widget> pages;

  @override
  void initState() {
    pages = [
      HomeScreen(),
      Container(),
      Container(),
      Container(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<BnbCubit>(),
      child: BlocBuilder<BnbCubit, BnbState>(
        builder: (context, state) {
          return Scaffold(
            extendBody: true,
            body: pages[state.bnbIndex],
            bottomNavigationBar: IntrinsicHeight(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: MediaQuery.paddingOf(context).bottom + 5.h, left: 20.w, right: 20.w),
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
                  borderRadius: BorderRadius.circular(5000.r),
                ),
                child: Row(
                  children: [
                    BnbIcon(
                      text: "Home",
                      icon: AppIcons.home,
                      selected: state.bnbIndex == 0,
                      onTap: () {if (state.bnbIndex != 0) {context.read<BnbCubit>().changeIndex(currentIndex: 0);}},
                    ),
                    BnbIcon(
                      text: "Shifts",
                      icon: AppIcons.shifts,
                      selected: state.bnbIndex == 1,
                      onTap: () {if (state.bnbIndex != 1) {context.read<BnbCubit>().changeIndex(currentIndex: 1);}},
                    ),
                    BnbIcon(
                      text: "Notifications",
                      icon: AppIcons.notifications,
                      selected: state.bnbIndex == 2,
                      onTap: () {if (state.bnbIndex != 2) {context.read<BnbCubit>().changeIndex(currentIndex: 2);}},
                    ),
                    BnbIcon(
                      text: "Account",
                      icon: AppIcons.account,
                      selected: state.bnbIndex == 3,
                      onTap: () {if (state.bnbIndex != 3) {context.read<BnbCubit>().changeIndex(currentIndex: 3);}},
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}