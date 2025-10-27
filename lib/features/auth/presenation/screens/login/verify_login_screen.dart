import 'package:stat_doctor/core/injection/injection_container.dart';
import 'package:stat_doctor/core/navigation/app_navigator.dart';
import 'package:stat_doctor/core/toast/app_toast.dart';
import 'package:stat_doctor/core/widgets/app_button.dart';
import 'package:stat_doctor/core/widgets/custom_loading.dart';
import 'package:stat_doctor/core/widgets/otp_text_form_field.dart';
import 'package:stat_doctor/features/auth/data/objects_value/login_params.dart';
import 'package:stat_doctor/features/auth/data/objects_value/send_sms_params.dart';
import 'package:stat_doctor/features/auth/presenation/cubit/auth_cubit.dart';
import 'package:stat_doctor/features/auth/presenation/screens/signup/signup_screen.dart';
import 'package:stat_doctor/features/auth/presenation/widgets/auth_appbar.dart';
import 'package:stat_doctor/features/auth/presenation/widgets/auth_header.dart';
import 'package:stat_doctor/features/auth/presenation/widgets/verify_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/features/layout/layout_inj.dart';
import 'package:stat_doctor/features/layout/presentation/screen/layout_screen.dart';
import 'package:stat_doctor/features/options/presentation/cubit/options_cubit.dart';


class VerifyLoginScreen extends StatefulWidget {
  final String countryCode;
  final String phone;
  const VerifyLoginScreen({super.key, required this.countryCode, required this.phone});
  @override
  State<VerifyLoginScreen> createState() => _VerifyLoginScreenState();
}

class _VerifyLoginScreenState extends State<VerifyLoginScreen> {
  TextEditingController otpController = TextEditingController();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          if(state.user.registerFlag) {
            sl<AppNavigator>().pushReplacement(screen: MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => sl<AuthCubit>(),),
                BlocProvider(create: (context) => sl<OptionsCubit>(),),
              ],
              child: SignupScreen(code: otpController.text,),
            ));
          } else {
            sl<AppNavigator>().pushAndRemoveUntil(screen: MultiBlocProvider(providers: appLayoutBlocs(context), child: LayoutScreen(),));
          }
        } else if (state is LoginFailure) {
          appToast(context: context, type: ToastType.error, message: state.message);
        } else if (state is SendSmsSuccess) {
          appToast(message: state.message, type: ToastType.success, context: context);
        }
      },
      child: Scaffold(
        appBar: AuthAppbar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          child: Column(
            spacing: 30.h,
            children: [
              AuthHeader(
                title: "OTP Verification",
                description: "Enter the verification code we just sent on your Phone Number."
              ),
              Column(
                spacing: 10.h,
                children: [
                  OtpTexFormField(onChanged: (value) {otpController.text = value;}),
                  VerifyTimer(onTimerFinished: () {context.read<AuthCubit>().sendSmsLogin(params: SendSmsParams(phone: widget.phone, countryCode: widget.countryCode));},)
                ],
              ),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  if(state is LoginLoading) {return const CustomLoading();}
                  return AppButton(
                    onTap: () {
                      if (otpController.text.length == 4) {
                        context.read<AuthCubit>().login(params: LoginParams(countryCode: widget.countryCode, phone: widget.phone, code: otpController.text));
                      } else {
                        appToast(context: context, type: ToastType.error, message: "Please enter the 4-digit code");
                      }
                    },
                    text: "Verify",
                  );
                },
              ),
            ].animate(interval: 300.ms).fade(duration: 300.ms).moveY(delay: 100.ms, duration: 400.ms),
          ),
        ),
      ),
    );
  }
}