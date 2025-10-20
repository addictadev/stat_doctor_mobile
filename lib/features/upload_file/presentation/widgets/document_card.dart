// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/config/app_icons.dart';
import 'package:stat_doctor/core/config/styles/styles.dart';
import 'package:stat_doctor/core/injection/injection_container.dart';
import 'package:stat_doctor/core/services/media_service/media_services.dart';
import 'package:stat_doctor/core/toast/app_toast.dart';
import 'package:stat_doctor/core/widgets/app_shimmer.dart';
import 'package:stat_doctor/core/widgets/circle_container.dart';
import 'package:stat_doctor/core/widgets/shimmer_shape.dart';
import 'package:stat_doctor/features/upload_file/model/upload_file.dart';
import 'package:stat_doctor/features/upload_file/presentation/cubit/upload_file_cubit.dart';

class DocumentCard extends StatefulWidget {
  final ValueNotifier<UploadFile?> documentFile;
  const DocumentCard({required this.documentFile, super.key});

  @override
  State<DocumentCard> createState() => _DocumentCardState();
}

class _DocumentCardState extends State<DocumentCard> {
  final MediaService _mediaService  = sl<MediaService>();

  Future<void> _getMultipleFile(BuildContext context) async {
    final selectedFiles = await _mediaService.uploadFiles(context);
    if (selectedFiles != null && selectedFiles.isNotEmpty) {
      final file = selectedFiles.whereType<File>().first;
      context.read<UploadFileCubit>().uploadFile(filePath: file.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UploadFileCubit>(),
      child: BlocConsumer<UploadFileCubit, UploadFileState>(
        listener: (context, state) {
          if (state is UploadFileLoaded) {
            widget.documentFile.value = state.uploadFile;
          } else if (state is UploadFileFailure) {
            appToast(context: context, type: ToastType.error, message: state.message);
          }
        },
        builder: (context, state) {
          if (state is UploadFileLoading) {return AppShimmer(child: ShimmerShape(width: double.infinity, height: 50.h, radius: 1000.r,));}
          return InkWell(
            onTap: () {
              if(widget.documentFile.value != null) {OpenFile.open(widget.documentFile.value?.path ?? "",);} 
              else {_getMultipleFile(context);}
            },
            overlayColor: WidgetStatePropertyAll(AppColors.transparent),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                border: Border.all(color: Theme.of(context).dividerColor),
                borderRadius: BorderRadius.circular(500.r),
              ),
              child: widget.documentFile.value == null ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10.w,
                children: [
                  AppIcons.icon(icon: AppIcons.uploadDocument, color: Theme.of(context).colorScheme.onSurface, size: 18.r),
                  Text("Upload Document", style: TextStyles.textViewMedium14),
                ],
              ) : 
              Row(
                spacing: 10.w,
                children: [
                  AppIcons.icon(icon: AppIcons.pdf, size: 18.r),
                  Expanded(child: Text(widget.documentFile.value?.name ?? "", style: TextStyles.textViewMedium14, maxLines: 1, overflow: TextOverflow.ellipsis,)),
                  CircleContainer(
                    onTap: () {setState(() {widget.documentFile.value = null;});},
                    size: 20,
                    borderColor: Theme.of(context).colorScheme.onSurface,
                    child: AppIcons.icon(icon: AppIcons.failure, size: 10, color: Theme.of(context).colorScheme.onSurface),
                  )
                ],
              )
            ),
          );
        },
      ),
    );
  }
}