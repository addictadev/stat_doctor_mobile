import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/custom_container.dart';
import 'package:stat_doctor/core/widgets/default_container.dart';
import 'package:stat_doctor/features/notification/data/enum/notification_status.dart';
import 'package:stat_doctor/features/notification/data/methods/notification_status_methods.dart';
import 'package:stat_doctor/features/notification/presentation/widgets/dismissable_delete_card.dart';

class NotificationCard extends StatelessWidget {
  final int index;
  final NotificationStatus status;
  const NotificationCard({super.key, required this.status, required this.index});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(index.toString()),
      background: DismissableDeleteCard(),
      direction: DismissDirection.endToStart,
      child: DefaultContainer(
        child: Row(
          spacing: 10.w,
          children: [
            CustomContainer(
              size: 50,
              color: Theme.of(context).scaffoldBackgroundColor,
              radius: 15,
              child: AppIcons.icon(icon: NotificationStatusMethods.getIcon(status), size: 24, color: NotificationStatusMethods.getIconColor(context, status)),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Notification", style: TextStyles.textViewBold14,),
                  Text("Your application for The Avenue Hospital  has been accepted. ", style: TextStyles.textViewRegular13,),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}