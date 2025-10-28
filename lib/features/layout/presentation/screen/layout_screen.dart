import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat_doctor/core/toast/app_toast.dart';
import 'package:stat_doctor/core/widgets/custom_animation_loading.dart';
import 'package:stat_doctor/features/account/presentation/cubit/account_cubit.dart';
import 'package:stat_doctor/features/account/presentation/screens/account_screen.dart';
import 'package:stat_doctor/features/home/home_inj.dart';
import 'package:stat_doctor/features/home/presentation/screens/home_screen.dart';
import 'package:stat_doctor/features/layout/presentation/cubit/bnb_cubit.dart';
import 'package:stat_doctor/features/layout/presentation/widget/layout_bnb.dart';
import 'package:stat_doctor/features/notification/presentation/screens/notification_screen.dart';
import 'package:stat_doctor/features/shifts/presentation/screens/my_shifts_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});
  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {

  @override
  void initState() {
    super.initState();
    context.read<AccountCubit>().getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountCubit, AccountState>(
      listener: (context, state) {
        if(state is ProfileFailure) {appToast(context: context, type: ToastType.error, message: state.message);}
      },
      buildWhen: (previous, current) => current is ProfileLoaded,
      builder: (context, state) {
        if(state is ProfileLoaded) {
          return BlocBuilder<BnbCubit, BnbState>(
            builder: (context, bnbState) {
              return Scaffold(
                extendBody: true,
                bottomNavigationBar: LayoutBnb(state: bnbState),
                body: <Widget>[
                  MultiBlocProvider(providers: appHomeBlocs(context), child: HomeScreen(),),
                  MyShiftsScreen(),
                  NotificationScreen(),
                  AccountScreen(user: state.user),
                ][bnbState.bnbIndex],
              );
            },
          );
        }
        return CustomAnimationLoading(color: Theme.of(context).scaffoldBackgroundColor);
      },
    );
  }
}