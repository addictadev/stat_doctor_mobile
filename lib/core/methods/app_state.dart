import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat_doctor/core/injection/injection_container.dart';
import 'package:stat_doctor/core/storage/data/storage.dart';
import 'package:stat_doctor/features/auth/presenation/cubit/auth_cubit.dart';
import 'package:stat_doctor/features/auth/presenation/screens/login/login_screen.dart';
import 'package:stat_doctor/features/layout/layout_inj.dart';
import 'package:stat_doctor/features/layout/presentation/screen/layout_screen.dart';
import 'package:stat_doctor/features/onboarding/presentation/screens/onboarding_screen.dart';

class AppState {
  static Widget currentScreen(BuildContext context) {
    if (sl<Storage>().getOnboarding()) {
      if(sl<Storage>().getToken() != null && sl<Storage>().isAuthorized()) {
        return MultiBlocProvider(providers: appLayoutBlocs(context), child: LayoutScreen(),);
      } else {
        return BlocProvider(create: (context) => sl<AuthCubit>(), child: LoginScreen());
      }
    } else {
      return OnboardingScreen();
    }
  } 
}