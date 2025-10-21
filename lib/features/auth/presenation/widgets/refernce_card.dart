import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/utils/validator.dart';
import 'package:stat_doctor/core/widgets/align_text.dart';
import 'package:stat_doctor/core/widgets/app_dropdown.dart';
import 'package:stat_doctor/core/widgets/app_text_form_field.dart';
import 'package:stat_doctor/core/widgets/clickable_text.dart';
import 'package:stat_doctor/features/auth/data/objects_value/register_params.dart';
import 'package:stat_doctor/features/options/presentation/cubit/options_cubit.dart';

class RefernceCard extends StatefulWidget {
  final ReferencesDTO reference;
  final Function() onRemove;
  final bool showRemove;
  const RefernceCard({required this.reference, required this.onRemove, required this.showRemove, super.key});
  @override
  State<RefernceCard> createState() => _RefernceCardState();
}

class _RefernceCardState extends State<RefernceCard> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController hospitalCurrentController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController seniorityController = TextEditingController();
  final TextEditingController specialtyController = TextEditingController();

  void updateReference() {
    fullNameController.text = widget.reference.fullName ?? "";
    emailController.text = widget.reference.email ?? "";
    hospitalCurrentController.text = widget.reference.hospitalCurrent ?? "";
    mobileController.text = widget.reference.mobile ?? "";
    seniorityController.text = widget.reference.seniority ?? "";
    specialtyController.text = widget.reference.specialty ?? "";
  }

  String? getSpecialtyName(String? specialty) {
    for (var element in context.read<OptionsCubit>().specialtiesOptions) {
      if (element.id == specialty) {
        return element.name;
      }
    }
    return null;
  }

  String? getSpecialtyId(String? name) {
    for (var element in context.read<OptionsCubit>().specialtiesOptions) {
      if (element.name == name) {
        return element.id;
      }
    }
    return null;
  }

  String? getSeniorityName(String? seniority) {
    for (var element in context.read<OptionsCubit>().seniorityOptions) {
      if (element.id == seniority) {
        return element.name;
      }
    }
    return null;
  }

  String? getSeniorityId(String? name) {
    for (var element in context.read<OptionsCubit>().seniorityOptions) {
      if (element.name == name) {
        return element.id;
      }
    }
    return null;
  }

  @override
  void initState() {
    updateReference();
    super.initState();
  }


  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    hospitalCurrentController.dispose();
    mobileController.dispose();
    seniorityController.dispose();
    specialtyController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 10.w,
          children: [
            Expanded(
              child: Text(
                "Reference ${widget.reference.seq}",
                style: TextStyles.textViewMedium16,
              ),
            ),
            if(widget.showRemove)
            ClickableText(
              onTap: widget.onRemove,
              text: "Remove",
              textStyle: TextStyles.textViewMedium12.copyWith(color: AppColors.red),
            )
          ],
        ),

        AlignText(
          text: "Reference's full name",
          style: TextStyles.textViewMedium14,
          padding: EdgeInsetsDirectional.only(start: 5.w, top: 15.h, bottom: 5.h),
        ),
        AppTextFormField(
          controller: fullNameController,
          hintText: "Enter full name",
          validator: (value) => Validator.defaultValidator(value),
          onChanged: (value) {setState(() {widget.reference.fullName = value;});},
        ),

        AlignText(
          text: "Reference's mobile",
          style: TextStyles.textViewMedium14,
          padding: EdgeInsetsDirectional.only(start: 5.w, top: 15.h, bottom: 5.h),
        ),
        AppTextFormField(
          controller: mobileController,
          hintText: "0498 765 432",
          keyboardType: TextInputType.phone,
          validator: (value) => Validator.defaultValidator(value),
          onChanged: (value) {setState(() {widget.reference.mobile = value;});},
        ),

        AlignText(
          text: "Reference's email",
          style: TextStyles.textViewMedium14,
          padding: EdgeInsetsDirectional.only(start: 5.w, top: 15.h, bottom: 5.h),
        ),
        AppTextFormField(
          controller: emailController,
          hintText: "example@email.com",
          keyboardType: TextInputType.emailAddress,
          validator: (value) => Validator.defaultValidator(value),
          onChanged: (value) {setState(() {widget.reference.email = value;});},
        ),


        AlignText(
          text: "Select reference’s specialty",
          style: TextStyles.textViewMedium14,
          padding: EdgeInsetsDirectional.only(start: 5.w, top: 15.h, bottom: 5.h),
        ),
        AppDropdown(
          items: context.read<OptionsCubit>().specialtiesOptions.map((e) => e.name).toList(),
          initialItem: getSpecialtyName(widget.reference.specialty),
          hintText: "Select...",
          validator: (value) => Validator.defaultValidator(value),
          onChanged: (value) {setState(() {widget.reference.specialty = getSpecialtyId(value);});},
        ),


        AlignText(
          text: "Select reference’s seniority",
          style: TextStyles.textViewMedium14,
          padding: EdgeInsetsDirectional.only(start: 5.w, top: 15.h, bottom: 5.h),
        ),
        AppDropdown(
          items: context.read<OptionsCubit>().seniorityOptions.map((e) => e.name).toList(),
          initialItem: getSeniorityName(widget.reference.seniority),
          hintText: "Select...",
          validator: (value) => Validator.defaultValidator(value),
          onChanged: (value) {setState(() {widget.reference.seniority = getSeniorityId(value);});},
        ),


        AlignText(
          text: "Reference's current hospital",
          style: TextStyles.textViewMedium14,
          padding: EdgeInsetsDirectional.only(start: 5.w, top: 15.h, bottom: 5.h),
        ),
        AppTextFormField(
          controller: hospitalCurrentController,
          hintText: "The Royal Melbourne Hospital",
          validator: (value) => Validator.defaultValidator(value),
          onChanged: (value) {setState(() {widget.reference.hospitalCurrent = value;});},
        ),

      ],
    );
  }
}