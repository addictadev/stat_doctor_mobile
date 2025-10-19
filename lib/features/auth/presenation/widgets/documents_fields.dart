// import 'package:stat_doctor/core/extensions/extensions.dart';
// import 'package:stat_doctor/core/utils/validator.dart';
// import 'package:stat_doctor/core/widgets/align_text.dart';
// import 'package:stat_doctor/core/widgets/app_text_form_field.dart';
// import 'package:stat_doctor/features/country_city/domain/entity/country.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class DocumentsFields extends StatelessWidget {
//   final GlobalKey<FormState> formKey;
//   final TextEditingController idNumberController;
//   final Country country;

//   const DocumentsFields({
//     super.key,
//     required this.country,
//     required this.formKey,
//     required this.idNumberController,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: formKey,
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 30.w),
//         child: Column(
//           children: [
//             AlignText(
//               text: context.l10n.idNumber,
//               textColor: Theme.of(context).hintColor,
//               padding: EdgeInsetsDirectional.only(bottom: 5.h, start: 5.w),
//             ),
//             AppTextFormField(
//               controller: idNumberController,
//               hintText: context.l10n.enterIdNumber,
//               keyboardType: TextInputType.number,
//               validator: (value) => Validator.nationalIdValidator(value, country.payment),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }