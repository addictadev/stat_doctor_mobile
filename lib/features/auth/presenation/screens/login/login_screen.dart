import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/injection/injection_container.dart';
import 'package:stat_doctor/core/methods/biometric_authentication.dart';
import 'package:stat_doctor/core/navigation/app_navigator.dart';
import 'package:stat_doctor/core/toast/app_toast.dart';
import 'package:stat_doctor/core/utils/validator.dart';
import 'package:stat_doctor/core/widgets/app_button.dart';
import 'package:stat_doctor/core/widgets/custom_loading.dart';
import 'package:stat_doctor/core/widgets/custom_rich_text.dart';
import 'package:stat_doctor/core/widgets/textformfield_phone.dart';
import 'package:stat_doctor/features/auth/data/objects_value/send_sms_params.dart';
import 'package:stat_doctor/features/auth/presenation/cubit/auth_cubit.dart';
import 'package:stat_doctor/features/auth/presenation/screens/login/verify_login_screen.dart';
import 'package:stat_doctor/features/auth/presenation/screens/signup/signup_screen.dart';
import 'package:stat_doctor/features/auth/presenation/widgets/auth_appbar.dart';
import 'package:stat_doctor/features/auth/presenation/widgets/auth_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/features/options/presentation/cubit/options_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController(text:  "+61");

  @override
  void dispose() {
    phoneController.dispose();
    countryCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthAppbar(),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
        child: CustomRichText(
          textAlign: TextAlign.center,
          startSubText: "By continuing, you agree to our\n",
          centerSubText: "Privacy Policy & Terms of Use",
          startSubTextStyle: TextStyles.textViewRegular13.copyWith(color: Theme.of(context).hintColor, height: 2.5),
          centerSubTextStyle: TextStyles.textViewMedium14.copyWith(color: Theme.of(context).primaryColor),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 30.h,
            children: [
              AuthHeader(
                title: "Welcome to StatDoctor!",
                description: "No Agency, Less Problems.\nBegin creating your StatDoctor profile below:",
              ),
              Column(
                spacing: 15.h,
                children: [
                  TextFormFieldPhone(
                    countryCodeController: countryCodeController,
                    phoneController: phoneController,
                    validator: (value) => Validator.phoneNumberValidator(countryCodeController.text + phoneController.text),
                    hintText: "412345678",
                    label: "Mobile Number",
                  ),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is SendSmsSuccess) {
                        appToast(context: context, type: ToastType.success, message: state.message);
                        sl<AppNavigator>().push(screen: BlocProvider(
                          create: (context) => sl<AuthCubit>(),
                          child: VerifyLoginScreen(countryCode: countryCodeController.text, phone: phoneController.text),
                        ));
                      } else if (state is SendSmsFailure) {
                        appToast(context: context, type: ToastType.error, message: state.message);
                      }
                    },
                    builder: (context, state) {
                      if (state is SendSmsLoading) {return const CustomLoading();}
                      return AppButton(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthCubit>().sendSmsLogin(params: SendSmsParams(phone:phoneController.text, countryCode: countryCodeController.text));
                          }
                        },
                        text: "Continue",
                      );
                    },
                  ),
                  if (BiometricAuthenticationService.instance.hasBiometricAuthentication)
                  AppButton(
                    color: Theme.of(context).colorScheme.secondary,
                    onTap: () async{
                      final result = await BiometricAuthenticationService.instance.authenticate();
                      debugPrint("result: $result");

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 15.w,
                      children: [
                        AppIcons.icon(icon: BiometricAuthenticationService.instance.isTouchIdAvailable ? AppIcons.touchId : AppIcons.faceId, color: Theme.of(context).colorScheme.onSurface),
                        Text("Login with ${BiometricAuthenticationService.instance.isTouchIdAvailable ? "TouchID" : "FaceID"}", style: TextStyles.textViewMedium14),
                      ],
                    ),
                  ),
                  CustomRichText(
                    textAlign: TextAlign.center,
                    startSubText: "Don't have an account? ",
                    centerSubText: "Signup",
                    startSubTextStyle: TextStyles.textViewRegular13.copyWith(color: Theme.of(context).hintColor, height: 2.5),
                    centerSubTextStyle: TextStyles.textViewMedium14.copyWith(color: Theme.of(context).primaryColor),
                    onCenterSubTextTap: () {
                      sl<AppNavigator>().pushReplacement(screen: MultiBlocProvider(
                        providers: [
                          BlocProvider(create: (context) => sl<AuthCubit>(),),
                          BlocProvider(create: (context) => sl<OptionsCubit>(),),
                        ],
                        child: SignupScreen(),
                      ));
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}