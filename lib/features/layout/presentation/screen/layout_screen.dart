import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/injection/injection_container.dart';
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
      Container(color: Colors.red,),
      Container(color: Colors.blue,),
      Container(color: Colors.green,),
      Container(color: Colors.yellow,),
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
            body: pages[state.bnbIndex],
            bottomNavigationBar: IntrinsicHeight(
              child: ColoredBox(
                color: Theme.of(context).cardColor,
                child: SafeArea(
                  top: false,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            ),
          );
        },
      ),
    );
  }
}
