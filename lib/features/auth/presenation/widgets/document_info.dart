import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/widgets/custom_rich_text.dart';

class DocumentInfo extends StatelessWidget {
  const DocumentInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5.h,
      children: [
        Row(
          spacing: 10.w,
          children: [
            Expanded(child: Text("Proof of identity", style: TextStyles.textViewMedium16)),
            AppIcons.icon(icon: AppIcons.info, color: Theme.of(context).hintColor, size: 14),
          ],
        ),
        CustomRichText(
          startSubText: "Documents must equal to minimum",
          centerSubText: " 100 points. ",
          endSubText: "You must provide AT LEAST 1 primary document. Documents must be certified copies.",
          startSubTextStyle: TextStyles.textViewRegular14.copyWith(color: Theme.of(context).hintColor),
          centerSubTextStyle: TextStyles.textViewMedium14,
          endSubTextStyle: TextStyles.textViewRegular14.copyWith(color: Theme.of(context).hintColor),
        )
      ],
    );
  }
}