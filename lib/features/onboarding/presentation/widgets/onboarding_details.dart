import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/injection/injection_container.dart';
import 'package:stat_doctor/core/navigation/app_navigator.dart';
import 'package:stat_doctor/core/storage/data/storage.dart';
import 'package:stat_doctor/core/widgets/circle_container.dart';
import 'package:stat_doctor/core/widgets/clickable_text.dart';
import 'package:stat_doctor/features/auth/presenation/cubit/auth_cubit.dart';
import 'package:stat_doctor/features/auth/presenation/screens/login/login_screen.dart';

class OnboardingDetails extends StatelessWidget {
  const OnboardingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClickableText(
          onTap: () {
            sl<Storage>().storeOnboarding(isCompleted: true);
            sl<AppNavigator>().pushAndRemoveUntil(screen: BlocProvider(
              create: (context) => sl<AuthCubit>(),
              child: LoginScreen(),
            ));
          },
          text: 'Skip',
          textStyle: TextStyles.textViewMedium16.copyWith(color: AppColors.hintColorLight),
        ),
        Row(
          spacing: 5.w,
          children: List.generate(4, (index) => CircleContainer(
            size: 10,
            color: index == 0 ? AppColors.primaryDark : AppColors.primaryDark.withValues(alpha: 0.2),
          )),
        ),
        CircleContainer(
          onTap: () {
            sl<Storage>().storeOnboarding(isCompleted: true);
            sl<AppNavigator>().pushAndRemoveUntil(screen: BlocProvider(
              create: (context) => sl<AuthCubit>(),
              child: LoginScreen(),
            ));
          },
          size: 40,
          color: AppColors.primaryLight,
          child: Icon(Icons.arrow_forward, color: AppColors.scaffoldColorLight, size: 20.r,),
        )
      ],
    );
  }
}