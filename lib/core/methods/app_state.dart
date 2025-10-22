import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat_doctor/core/injection/injection_container.dart';
import 'package:stat_doctor/core/storage/data/storage.dart';
import 'package:stat_doctor/features/auth/presenation/cubit/auth_cubit.dart';
import 'package:stat_doctor/features/auth/presenation/screens/login/login_screen.dart';
import 'package:stat_doctor/features/onboarding/presentation/screens/onboarding_screen.dart';

class AppState {
  static Widget currentScreen() {
    if (sl<Storage>().getOnboarding()) {
      return BlocProvider(create: (context) => sl<AuthCubit>(), child: LoginScreen());
    } else {
      return OnboardingScreen();
    }
  } 
}