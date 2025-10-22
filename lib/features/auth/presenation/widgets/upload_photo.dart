import 'dart:io';
import 'package:be_widgets/be_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/injection/injection_container.dart';
import 'package:stat_doctor/core/toast/app_toast.dart';
import 'package:stat_doctor/core/widgets/app_shimmer.dart';
import 'package:stat_doctor/core/widgets/circle_container.dart';
import 'package:stat_doctor/core/widgets/custom_popup.dart';
import 'package:stat_doctor/core/widgets/shimmer_shape.dart';
import 'package:stat_doctor/core/widgets/upload_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/features/upload_file/presentation/cubit/upload_file_cubit.dart';

class UploadPhoto extends StatelessWidget {
  final TextEditingController photoProfileController;
  final TextEditingController photoProfilePathController;
  final TextEditingController photoProfileNameController;

  const UploadPhoto({required this.photoProfileController, required this.photoProfilePathController, required this.photoProfileNameController, super.key});

  bool hasImage() {return photoProfilePathController.text.isNotEmpty && photoProfileNameController.text.isNotEmpty && photoProfileController.text.isNotEmpty;}

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UploadFileCubit>(),
      child: Column(
        spacing: 10.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Photo Profile', style: TextStyles.textViewSemiBold14),
          BlocConsumer<UploadFileCubit, UploadFileState>(
            listener: (context, state) {
              if (state is UploadFileLoaded) {
                photoProfilePathController.text = state.uploadFile.path;
                photoProfileNameController.text = state.uploadFile.name;
                photoProfileController.text = state.uploadFile.url;
              } else if (state is UploadFileFailure) {
                appToast(context: context, type: ToastType.error, message: state.message);
              }
            },
            builder: (context, state) {
              if (state is UploadFileLoading) {return AppShimmer(child: ShimmerShape(width: 75.w, height: 75.h, radius: 5000.r,));}
              return BeBadge(
                offset: Offset(-10, 10),
                badge: CircleContainer(
                  onTap: () {
                    CustomPopup.appShowModalBottomSheet(
                      backgroundColor: Theme.of(context).cardColor,
                      context: context,
                      builder: (ctx) => UploadBottomSheet(onchange: (file) {context.read<UploadFileCubit>().uploadFile(filePath: file.path);},),
                    );
                  },
                  size: 25,
                  color: Theme.of(context).cardColor,
                  borderColor: Theme.of(context).dividerColor,
                  child: AppIcons.icon(icon: AppIcons.edit, color: Theme.of(context).colorScheme.onSurface, size: 10),
                ),
                child: CircleContainer(
                  size: 75,
                  color: Theme.of(context).cardColor,
                  borderColor: Theme.of(context).dividerColor,
                  noAlignment: hasImage(),
                  child: hasImage() ? Image.file(File(photoProfilePathController.text,), fit: BoxFit.cover,):
                  AppIcons.icon(icon: AppIcons.gallery, color: Theme.of(context).hintColor, size: 25),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}