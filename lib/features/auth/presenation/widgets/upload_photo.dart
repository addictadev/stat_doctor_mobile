// // ignore_for_file: use_build_context_synchronously

// import 'dart:io';
// import 'package:stat_doctor/core/constant/app_colors.dart';
// import 'package:stat_doctor/core/constant/app_icons.dart';
// import 'package:stat_doctor/core/constant/styles/styles.dart';
// import 'package:stat_doctor/core/extensions/extensions.dart';
// import 'package:stat_doctor/core/methods/check_image.dart';
// import 'package:stat_doctor/core/widgets/app_shimmer.dart';
// import 'package:stat_doctor/core/widgets/circle_container.dart';
// import 'package:stat_doctor/features/auth/presenation/widgets/upload_bottom_sheet.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class UploadPhoto extends StatefulWidget {
//   final TextEditingController photoPathController;
//   const UploadPhoto({required this.photoPathController, super.key});
//   @override
//   State<UploadPhoto> createState() => _UploadPhotoState();
// }

// class _UploadPhotoState extends State<UploadPhoto> {
//   bool isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       spacing: 10.h,
//       children: [
//         isLoading ? AppShimmer(child: CircleContainer(size: 100, color: Theme.of(context).primaryColor,),) :
//         CircleContainer(
//           onTap: () {
//             showModalBottomSheet(
//               context: context,
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25.r))),
//               isScrollControlled: true,
//               backgroundColor: AppColors.transparent ,
//               builder: (ctx) => UploadBottomSheet(
//                 onchange: (file) async {
//                   setState(() {isLoading = true;});
//                   if(await CheckImageAI.checkImage(image: file, context: context)) {
//                     setState(() {widget.photoPathController.text = file.path;});
//                   }
//                   setState(() {isLoading = false;});
//                 },
//               )
//             );
//           },
//           size: 100,
//           noAlignment: widget.photoPathController.text != '',
//           color: Theme.of(context).scaffoldBackgroundColor,
//           child: widget.photoPathController.text != '' ?
//           Image.file(File(widget.photoPathController.text,), fit: BoxFit.cover,):
//           AppIcons.icon(icon: AppIcons.uploadPhoto, color: Theme.of(context).primaryColor),
//         ),
//         Text(context.l10n.photoWhiteBackground, style: TextStyles.textViewRegular12.copyWith(color: Theme.of(context).hintColor))
//       ],
//     );
//   }
// }