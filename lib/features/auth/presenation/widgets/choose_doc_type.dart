// import 'package:stat_doctor/core/extensions/extensions.dart';
// import 'package:stat_doctor/core/widgets/align_text.dart';
// import 'package:stat_doctor/features/auth/presenation/widgets/doc_type_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ChooseDocType extends StatefulWidget {
//   final Color? cardColor;
//   final TextEditingController docTypeController;
//   const ChooseDocType({super.key, required this.docTypeController, this.cardColor});
//   @override
//   State<ChooseDocType> createState() => _ChooseDocTypeState();
// }

// class _ChooseDocTypeState extends State<ChooseDocType> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         AlignText(
//           text: context.l10n.chooseDocumentType,
//           padding: EdgeInsetsDirectional.only(start: 35.w, top: 15.h, bottom: 10.h),
//         ),
//         SizedBox(
//           height: 35.h,
//           child: ListView(
//             scrollDirection: Axis.horizontal,
//             padding: EdgeInsets.symmetric(horizontal: 30.w),
//             children: [
//               DocTypeCard(
//                 onTap: () {if (widget.docTypeController.text != "NATIONAL_ID") {setState(() {widget.docTypeController.text = "NATIONAL_ID";});}},
//                 selected: widget.docTypeController.text == 'NATIONAL_ID' ,
//                 cardColor: widget.cardColor,
//                 title: context.l10n.nationalId
//               ),
//               SizedBox(width: 10.w,),
//               DocTypeCard(
//                 onTap: () {if (widget.docTypeController.text != "IQAMA_RESIDANCE_ID") {setState(() {widget.docTypeController.text = "IQAMA_RESIDANCE_ID";});}},
//                 selected: widget.docTypeController.text == 'IQAMA_RESIDANCE_ID' ,
//                 cardColor: widget.cardColor,
//                 title: context.l10n.iqamaResidenceId
//               ),
//               SizedBox(width: 10.w,),
//               DocTypeCard(
//                 onTap: () {if (widget.docTypeController.text != "PASSPORT") {setState(() {widget.docTypeController.text = "PASSPORT";});}},
//                 selected: widget.docTypeController.text == 'PASSPORT' ,
//                 cardColor: widget.cardColor,
//                 title: context.l10n.passport
//               )
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }