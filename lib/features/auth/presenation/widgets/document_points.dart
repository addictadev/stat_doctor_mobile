import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/circle_container.dart';
import 'package:stat_doctor/features/upload_file/model/upload_file.dart';

class DocumentPoints extends StatelessWidget {
  final ValueNotifier<UploadFile?> primaryDocumentFile;
  final ValueNotifier<UploadFile?> otherDocumentFile;
  const DocumentPoints({required this.primaryDocumentFile, required this.otherDocumentFile, super.key});

  int getPoints() {
    if(primaryDocumentFile.value != null && otherDocumentFile.value != null) {
      return 200;
    } else if(primaryDocumentFile.value != null || otherDocumentFile.value != null) {
      return 100;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(15.r),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border.all(color: Theme.of(context).dividerColor),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            spacing: 10.w,
            children: [
              CircleContainer(
                size: 40,
                color: AppColors.deepOrange.withValues(alpha: 0.1),
                child: AppIcons.icon(icon: AppIcons.award, color: AppColors.deepOrange),
              ),
              Expanded(child: Text("Total points", style: TextStyles.textViewSemiBold16)),
              Text("${getPoints()}/100", style: TextStyles.textViewSemiBold16),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            color: AppColors.yellow.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(200.r),
          ),
          child: Row(
            spacing: 10.w,
            children: [
              AppIcons.icon(icon: AppIcons.messageQuestion, color: AppColors.yellow),
              Expanded(child: Text("How to upload all documents correctly?", style: TextStyles.textViewMedium13)),
            ],
          ),
        )
      ],
    );
  }
}