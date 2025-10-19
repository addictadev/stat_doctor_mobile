// import 'package:animated_custom_dropdown/custom_dropdown.dart';
// import 'package:country_picker/country_picker.dart';
// import 'package:stat_doctor/core/constant/app_icons.dart';
// import 'package:stat_doctor/core/extensions/extensions.dart';
// import 'package:stat_doctor/core/theme/drop_down_theme.dart';
// import 'package:stat_doctor/core/utils/validator.dart';
// import 'package:stat_doctor/core/widgets/align_text.dart';
// import 'package:stat_doctor/core/widgets/app_text_form_field.dart';
// import 'package:stat_doctor/features/country_city/domain/entity/city.dart';
// import 'package:stat_doctor/features/country_city/presentation/cubit/country_city_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class PersonalDetailsFields extends StatelessWidget {
//   final GlobalKey<FormState> formKey;
//   final TextEditingController photoPathController;
//   final TextEditingController firstNameController;
//   final TextEditingController lastNameController;
//   final TextEditingController nationalityController;
//   final TextEditingController nationalityCodeController;
//   final TextEditingController cityIdController;

//   const PersonalDetailsFields({
//     super.key,
//     required this.formKey,
//     required this.photoPathController,
//     required this.firstNameController,
//     required this.lastNameController,
//     required this.nationalityController,
//     required this.nationalityCodeController,
//     required this.cityIdController
//   });

//   String? getInitCity(List<City> cities, String cityId) {
//     for (City city in cities) {
//       if (city.id.toString() == cityId) {return city.name;}
//     }
//     return null;
//   }

//   void changeCity(List<City> cities, String? cityNamne) {
//     for (City city in cities) {
//       if (city.name == cityNamne) {cityIdController.text =  city.id.toString();}
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: formKey,
//       child: Column(
//         children: [
//           AlignText(
//             text: context.l10n.firstName,
//             textColor: Theme.of(context).hintColor,
//           ),
//           AppTextFormField(
//             controller: firstNameController,
//             hintText: context.l10n.enterFirstName,
//             validator: (value) => Validator.defaultValidator(value),
//           ),
//           AlignText(
//             text: context.l10n.lastName,
//             textColor: Theme.of(context).hintColor,
//           ),
//           AppTextFormField(
//             controller: lastNameController,
//             hintText: context.l10n.enterLastName,
//             validator: (value) => Validator.defaultValidator(value),
//           ),      
//           AlignText(
//             text: context.l10n.nationality,
//             textColor: Theme.of(context).hintColor,
//           ),
//           AppTextFormField(
//             controller: nationalityController,
//             hintText: context.l10n.selectNationality,
//             readOnly: true,
//             validator: (value) => Validator.defaultValidator(value),
//             onTap: () {
//               showCountryPicker(
//                 context: context,
//                 useSafeArea: true,
//                 moveAlongWithKeyboard: true,
//                 countryListTheme: CountryListThemeData(
//                   borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
//                   bottomSheetHeight: MediaQuery.sizeOf(context).height * 0.75,
//                   inputDecoration: InputDecoration(
//                     labelText: context.l10n.search,
//                     prefixIcon: Padding(
//                       padding: EdgeInsets.all(12.r),
//                       child: AppIcons.icon(size: 18, icon: AppIcons.search, color: Theme.of(context).hintColor),
//                     )
//                   )
//                 ),
//                 onSelect: (Country country) {
//                   nationalityCodeController.text = country.countryCode;
//                   nationalityController.text = country.name;
//                 },
//               );
//             },
//           ),
//           AlignText(
//             text: context.l10n.city,
//             textColor: Theme.of(context).hintColor,
//           ),
//           BlocBuilder<CountryCityCubit, CountryCityState>(
//             builder: (context, state) {
//               return CustomDropdown(
//                 items: state is CityLoaded ? state.cities.map((city) => city.name).toList() : [],
//                 initialItem: state is CityLoaded ? getInitCity(state.cities, cityIdController.text) : null,
//                 decoration: DropdownTheme.dropdownMultiSelectDecoration(context: context, borderColor: Theme.of(context).dividerColor),
//                 validator: (value) => Validator.defaultValidator(value),
//                 onChanged: (value) {if (state is CityLoaded) {changeCity(state.cities, value);}},
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }