import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/utils/validator.dart';
import 'package:stat_doctor/core/widgets/align_text.dart';
import 'package:stat_doctor/core/widgets/app_dropdown.dart';
import 'package:stat_doctor/core/widgets/clickable_text.dart';
import 'package:stat_doctor/features/auth/presenation/widgets/upload_other.dart';
import 'package:stat_doctor/features/options/data/model/options.dart';
import 'package:stat_doctor/features/options/presentation/cubit/options_cubit.dart';
import 'package:stat_doctor/features/upload_file/model/upload_file.dart';
import 'package:stat_doctor/features/upload_file/presentation/widgets/document_card.dart';

class PrimaryDocument extends StatefulWidget {
  final ValueNotifier<bool> uploadOtherDocument;
  final ValueNotifier<Options?> primaryDocument;
  final ValueNotifier<Options?> otherDocument;
  final ValueNotifier<UploadFile?> primaryDocumentFile;
  final ValueNotifier<UploadFile?> otherDocumentFile;

  const PrimaryDocument({
    required this.uploadOtherDocument,
    required this.primaryDocument,
    required this.otherDocument,
    required this.primaryDocumentFile,
    required this.otherDocumentFile,
    super.key,
  });

  @override
  State<PrimaryDocument> createState() => _PrimaryDocumentState();
}

class _PrimaryDocumentState extends State<PrimaryDocument> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AlignText(
          text: "Select primary document",
          style: TextStyles.textViewMedium14,
          padding: EdgeInsetsDirectional.only(start: 5.w, bottom: 5.h),
        ),
        AppDropdown(
          items: context.read<OptionsCubit>().primaryDocumentOptions.map((e) => e.name).toList(),
          initialItem: widget.primaryDocument.value?.name,
          hintText: "Select...",
          validator: (value) => Validator.defaultValidator(value),
          onChanged: (value) {if(value != null) {setState(() {widget.primaryDocument.value = context.read<OptionsCubit>().primaryDocumentOptions.firstWhere((e) => e.name == value);});}},
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: DocumentCard(documentFile: widget.primaryDocumentFile)
        ),
        widget.uploadOtherDocument.value ?
        Column(
          spacing: 10.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppDropdown(
              items: context.read<OptionsCubit>().otherDocumentOptions.map((e) => e.name).toList(),
              initialItem: widget.otherDocument.value?.name,
              hintText: "Select...",
              validator: (value) => Validator.defaultValidator(value),
              onChanged: (value) {if(value != null) {setState(() {widget.otherDocument.value = context.read<OptionsCubit>().otherDocumentOptions.firstWhere((e) => e.name == value);});}},
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: DocumentCard(documentFile: widget.otherDocumentFile)
            ),
            ClickableText(
              padding: EdgeInsetsDirectional.only(start: 10.w),
              onTap: () {
                widget.otherDocument.value = null;
                widget.otherDocumentFile.value = null;
                setState(() {widget.uploadOtherDocument.value = false;});
              },
              text: "Remove",
              textStyle: TextStyles.textViewRegular12.copyWith(color: AppColors.red),
            ),
          ],
        ):
        UploadOther(onTap: () {setState(() {widget.uploadOtherDocument.value = true;});}),
      ],
    );
  }
}