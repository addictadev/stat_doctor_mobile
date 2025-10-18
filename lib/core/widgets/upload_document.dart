import 'dart:io';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/enums/media_type.dart';
import 'package:stat_doctor/core/injection/injection_container.dart';
import 'package:stat_doctor/core/services/media_service/media_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

class UploadDocument extends StatefulWidget {
  final String icon;
  final TextEditingController controller;
  const UploadDocument({required this.icon, required this.controller, super.key});
  @override
  State<UploadDocument> createState() => _UploadDocumentState();
}

class _UploadDocumentState extends State<UploadDocument> {
  static final MediaService _mediaService  = sl<MediaService>();

  Future<void> _getImage() async {
    final pickedImageFile = await _mediaService.uploadImage(context, AppImageSource.gallery);
    if (pickedImageFile != null) {
      setState(() {widget.controller.text = pickedImageFile.path;});
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _getImage,
      overlayColor: WidgetStatePropertyAll(AppColors.transparent),
      child: Container(
        width: double.infinity,
        clipBehavior: Clip.hardEdge,
        height: MediaQuery.sizeOf(context).height * 0.18,
        alignment: widget.controller.text.isNotEmpty ? null : Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(15.r),
          border: DashedBorder.all(strokeAlign: BorderSide.strokeAlignOutside, width: 2.r, strokeCap: StrokeCap.butt, spaceLength: 3, dashLength: 3, color: Theme.of(context).primaryColor),
        ),
        child: widget.controller.text.isNotEmpty ?
        Image.file(File(widget.controller.text), fit: BoxFit.cover,):
        AppIcons.icon(icon: widget.icon, color: Theme.of(context).primaryColor, size: 35),
      ),
    );
  }
}