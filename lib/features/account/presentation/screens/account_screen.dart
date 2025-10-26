import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/widgets/app_button.dart';
import 'package:stat_doctor/features/account/presentation/widgets/account_card.dart';
import 'package:stat_doctor/features/account/presentation/widgets/account_header.dart';
import 'package:stat_doctor/features/account/presentation/widgets/app_version.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AccountHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 120.h),
              child: Column(
                spacing: 20.h,
                children: [
                  AccountCard(title: "Medical profile", icon: AppIcons.accountMedical, onTap: () {}),
                  AccountCard(title: "References (1/2 verified)", icon: AppIcons.accountReferences, onTap: () {}),
                  AccountCard(title: "Proof of ID & other documents", icon: AppIcons.accountDocuments, onTap: () {}),
                  AccountCard(title: "Notifications", icon: AppIcons.accountNotifications, onTap: () {}),
                  AccountCard(title: "StatDoctor Settings", icon: AppIcons.accountSettings, onTap: () {}),
                  AppButton(
                    borderColor: Theme.of(context).hintColor,
                    color: AppColors.transparent,
                    textColor: AppColors.red,
                    text: "Logout",
                    margin: EdgeInsets.only(top: 20.h),
                  ),
                  Appversion(),
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}