import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/utils/validator.dart';
import 'package:stat_doctor/core/widgets/align_text.dart';
import 'package:stat_doctor/core/widgets/app_dropdown.dart';
import 'package:stat_doctor/features/options/data/model/options.dart';
import 'package:stat_doctor/features/options/presentation/cubit/options_cubit.dart';

class MedicalDropdowns extends StatefulWidget {
  final ValueNotifier<Options?> medicalDegree;
  final ValueNotifier<Options?> skillLevel;
  final ValueNotifier<Options?> specialties;
  const MedicalDropdowns({super.key, required this.medicalDegree, required this.skillLevel, required this.specialties});
  @override
  State<MedicalDropdowns> createState() => _MedicalDropdownsState();
}

class _MedicalDropdownsState extends State<MedicalDropdowns> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AlignText(
          text: "Select your medical degree",
          style: TextStyles.textViewMedium14,
          padding: EdgeInsetsDirectional.only(start: 5.w, bottom: 5.h),
        ),
        AppDropdown(
          items: context.read<OptionsCubit>().medicalOptions.map((e) => e.name).toList(),
          initialItem: widget.medicalDegree.value?.name,
          hintText: "Select...",
          validator: (value) => Validator.defaultValidator(value),
          onChanged: (value) {if(value != null) {widget.medicalDegree.value = context.read<OptionsCubit>().medicalOptions.firstWhere((e) => e.name == value);}},
        ),
        AlignText(
          text: "What is your skill level",
          style: TextStyles.textViewMedium14,
          padding: EdgeInsetsDirectional.only(start: 5.w, top: 15.h, bottom: 5.h),
        ),
        AppDropdown(
          items: context.read<OptionsCubit>().skillOptions.map((e) => e.name).toList(),
          initialItem: widget.skillLevel.value?.name,
          hintText: "Select...",
          validator: (value) => Validator.defaultValidator(value),
          onChanged: (value) {if(value != null) {widget.skillLevel.value = context.read<OptionsCubit>().skillOptions.firstWhere((e) => e.name == value);}},
        ),
        AlignText(
          text: "Add your specialties",
          style: TextStyles.textViewMedium14,
          padding: EdgeInsetsDirectional.only(start: 5.w, top: 15.h, bottom: 5.h),
        ),
        AppDropdown(
          items: context.read<OptionsCubit>().specialtiesOptions.map((e) => e.name).toList(),
          initialItem: widget.specialties.value?.name,
          hintText: "Select...",
          validator: (value) => Validator.defaultValidator(value),
          onChanged: (value) {if(value != null) {widget.specialties.value = context.read<OptionsCubit>().specialtiesOptions.firstWhere((e) => e.name == value);}},
        ),
      ],
    );
  }
}