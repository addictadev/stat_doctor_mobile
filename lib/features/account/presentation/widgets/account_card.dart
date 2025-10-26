import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/custom_container.dart';

class AccountCard extends StatelessWidget {
  final String title;
  final String icon;
  final Function()? onTap;
  const AccountCard({super.key, required this.title, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      overlayColor: WidgetStatePropertyAll(AppColors.transparent),
      child: Row(
        spacing: 10.w,
        children: [
          CustomContainer(
            size: 45,
            color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
            child: AppIcons.icon(icon: icon, color: Theme.of(context).primaryColor,),
          ),
          Expanded(child: Text(title, style: TextStyles.textViewMedium14)),
          Icon(Icons.arrow_forward_ios, size: 16, color: Theme.of(context).hintColor,),
        ],
      ),
    );
  }
}