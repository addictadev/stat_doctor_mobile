// import 'package:stat_doctor/core/extensions/extensions.dart';
// import 'package:stat_doctor/core/utils/validator.dart';
// import 'package:stat_doctor/core/widgets/align_text.dart';
// import 'package:stat_doctor/core/widgets/app_text_form_field.dart';
// import 'package:stat_doctor/features/country_city/domain/entity/country.dart';
// import 'package:flutter/material.dart';

// class PaymentDetailsFields extends StatelessWidget {
//   final GlobalKey<FormState> formKey;
//   final Country country;
//   final TextEditingController bankNameController;
//   final TextEditingController ribController;
//   final TextEditingController iBANController;
//   final TextEditingController sTCPayMobileNumberController;
//   final TextEditingController sTCPayIDNumberController;

//   const PaymentDetailsFields({
//     super.key,
//     required this.formKey,
//     required this.country,
//     required this.ribController,
//     required this.bankNameController,
//     required this.iBANController,
//     required this.sTCPayMobileNumberController,
//     required this.sTCPayIDNumberController,
//   });

//   bool get _isMorocco => "MOROCCO_PAY" == country.payment;
//   bool get _isSaudi => "SAUDI_PAY" == country.payment;
//   bool get _isBahrain => "BAHRAIN_PAY" == country.payment;


//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: formKey,
//       child: Column(
//         children: [

//           if(_isBahrain)...[
//             AlignText(
//               text: context.l10n.bankName,
//               textColor: Theme.of(context).hintColor,
//             ),
//             AppTextFormField(
//               controller: bankNameController,
//               hintText: context.l10n.addBankName,
//               validator: (value) => Validator.defaultValidator(value),
//             ),


//             AlignText(
//               text: context.l10n.iban,
//               textColor: Theme.of(context).hintColor,
//             ),
//             AppTextFormField(
//               controller: iBANController,
//               hintText: context.l10n.enterIban,
//               validator: (value) => Validator.ibanValidator(value, country.payment),
//             ),
//           ],
          
//           if(_isMorocco)...[
//             AlignText(
//               text: "${context.l10n.bankName} (${context.l10n.optional})",
//               textColor: Theme.of(context).hintColor,
//             ),
//             AppTextFormField(
//               controller: bankNameController,
//               hintText: context.l10n.addBankName,
//               validator: (value) => Validator.defaultValidator(value),
//             ),


//             AlignText(
//               text: "${context.l10n.rib} (${context.l10n.optional})",
//               textColor: Theme.of(context).hintColor,
//             ),
//             AppTextFormField(
//               controller: ribController,
//               hintText: context.l10n.enterBankRib,
//             ),
//           ],

          
//           if(_isSaudi)...[
//             AlignText(
//               text: context.l10n.bankName,
//               textColor: Theme.of(context).hintColor,
//             ),
//             AppTextFormField(
//               controller: bankNameController,
//               hintText: context.l10n.addBankName,
//               validator: (value) => Validator.defaultValidator(value),
//             ),


//             AlignText(
//               text: context.l10n.iban,
//               textColor: Theme.of(context).hintColor,
//             ),
//             AppTextFormField(
//               controller: iBANController,
//               hintText: context.l10n.enterIban,
//               validator: (value) => Validator.ibanValidator(value, country.payment),
//             ),
            
            
//             AlignText(
//               text: context.l10n.stcPayMobileNumber,
//               textColor: Theme.of(context).hintColor,
//             ),
//             AppTextFormField(
//               controller: sTCPayMobileNumberController,
//               hintText: context.l10n.stcPayMobileNumber,
//               keyboardType: TextInputType.phone,
//               validator: (value) => Validator.phoneNumberValidator(value),
//             ),
            
            
//             AlignText(
//               text: context.l10n.stcPayIdNumber,
//               textColor: Theme.of(context).hintColor,
//             ),
//             AppTextFormField(
//               controller: sTCPayIDNumberController,
//               hintText: context.l10n.enterStcPayIdNumber,
//               keyboardType: TextInputType.number,
//               validator: (value) => Validator.stcPayIdValidator(value),
//             ),
//           ]
//         ],
//       ),
//     );
//   }
// }