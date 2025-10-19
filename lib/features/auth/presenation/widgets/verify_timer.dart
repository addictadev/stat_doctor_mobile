import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:stat_doctor/core/widgets/custom_rich_text.dart';
import 'package:stat_doctor/features/auth/presenation/cubit/auth_cubit.dart';

class VerifyTimer extends StatelessWidget {
  final Function() onTimerFinished;
  const VerifyTimer({required this.onTimerFinished, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return CustomRichText(
          startSubText: "Didn’t received code?  ",
          centerSubText: "Resend",
          startSubTextStyle: TextStyles.textViewRegular12,
          centerSubTextStyle: TextStyles.textViewBold12.copyWith(color: Theme.of(context).primaryColor),
          onCenterSubTextTap: () {if (state is! SendSmsLoading) {onTimerFinished();}},
        ).animate(
          delay: 200.ms,
          onPlay: (controller) => controller.repeat(reverse: true),
          target: state is! SendSmsLoading ? 1 : 0
        ).shimmer(duration: 1500.ms, color: Theme.of(context).scaffoldBackgroundColor);
      },
    );
  }
}