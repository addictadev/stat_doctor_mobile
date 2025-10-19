// import 'dart:io';
// import 'package:stat_doctor/core/constant/app_colors.dart';
// import 'package:stat_doctor/core/constant/app_icons.dart';
// import 'package:stat_doctor/core/services/media_service/media_services.dart';
// import 'package:stat_doctor/core/widgets/align_text.dart';
// import 'package:stat_doctor/injection_container.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

// class UploadDocument extends StatefulWidget {
//   final String title;
//   final String icon;
//   final TextEditingController photoPathController;
//   const UploadDocument({required this.title, required this.icon, required this.photoPathController, super.key});
//   @override
//   State<UploadDocument> createState() => _UploadDocumentState();
// }

// class _UploadDocumentState extends State<UploadDocument> {
//   static final MediaService _mediaService  = sl<MediaService>();

//   Future<void> _getImage() async {
//     final pickedImageFile = await _mediaService.uploadImage(context, AppImageSource.gallery);
//     if (pickedImageFile != null) {
//       setState(() {widget.photoPathController.text = pickedImageFile.path;});
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         AlignText(
//           text: widget.title,
//           padding: EdgeInsetsDirectional.only(top: 20.h, bottom: 10.h, start: 35.w)
//         ),
//         InkWell(
//           onTap: _getImage,
//           overlayColor: WidgetStatePropertyAll(AppColors.transparent),
//           child: Container(
//             width: double.infinity,
//             clipBehavior: Clip.hardEdge,
//             height: MediaQuery.sizeOf(context).height * 0.18,
//             margin: EdgeInsets.symmetric(horizontal: 30.w,),
//             alignment: widget.photoPathController.text != '' ? null : Alignment.center,
//             decoration: BoxDecoration(
//               color: Theme.of(context).scaffoldBackgroundColor,
//               borderRadius: BorderRadius.circular(15.r),
//               border: DashedBorder.all(strokeAlign: BorderSide.strokeAlignOutside, width: 2.r, strokeCap: StrokeCap.butt, spaceLength: 3, dashLength: 3, color: Theme.of(context).primaryColor),
//             ),
//             child: widget.photoPathController.text != '' ?
//             Image.file(File(widget.photoPathController.text), fit: BoxFit.cover,):
//             AppIcons.icon(icon: widget.icon, color: Theme.of(context).primaryColor, size: 35),
//           ),
//         ),
//       ],
//     );
//   }
// }