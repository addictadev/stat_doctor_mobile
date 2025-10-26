import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/widgets/circle_container.dart';
import 'package:stat_doctor/core/widgets/custom_popup.dart';
import 'package:stat_doctor/features/notification/data/enum/notification_status.dart';
import 'package:stat_doctor/features/notification/presentation/widgets/notification_card.dart';
import 'package:stat_doctor/features/notification/presentation/widgets/notification_delete_dialog.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        actions: [
          CircleContainer(
            onTap: () {
              CustomPopup.appShowDialog(
                context: context,
                builder: (ctx) => NotificationDeleteDialog(),
              );
            },
            size: 40,
            color: Theme.of(context).cardColor,
            margin: EdgeInsetsDirectional.only(end: 10.w),
            child: AppIcons.icon(icon: AppIcons.trash, size: 18, color: AppColors.red),
          )
        ],
      ),
      body: ListView.separated(
        padding: EdgeInsets.only(top: 10.h, bottom: 125.h, left: 20.w, right: 20.w),
        itemCount: 15,
        separatorBuilder: (context, index) => SizedBox(height: 10.h,),
        itemBuilder: (context, index) => NotificationCard(status: NotificationStatus.neww, index: index),
      ),
    );
  }
}