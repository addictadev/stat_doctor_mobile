import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stat_doctor/core/config/app_colors.dart';
import 'package:stat_doctor/core/widgets/circle_container.dart';
import 'package:stat_doctor/core/widgets/custom_loading.dart';
import 'package:stat_doctor/features/home/presentation/cubit/home_cubit.dart';

class HospitalFavButton extends StatefulWidget {
  final String hospitalAccountId;
  final bool isFav;
  const HospitalFavButton({super.key, required this.isFav, required this.hospitalAccountId});

  @override
  State<HospitalFavButton> createState() => _HospitalFavButtonState();
}

class _HospitalFavButtonState extends State<HospitalFavButton> {
  bool isFav = false;

  @override
  void initState() {
    isFav = widget.isFav;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return CircleContainer(
          onTap: () {
            if(isFav) {context.read<HomeCubit>().removeFromFavorite(hospitalAccountId: widget.hospitalAccountId);} 
            else {context.read<HomeCubit>().addToFavorite(hospitalAccountId: widget.hospitalAccountId);}
            isFav = !isFav;
          },
          size: 40,
          margin: EdgeInsetsDirectional.only(end:10.r),
          color: AppColors.textColorLight.withValues(alpha: 0.1),
          child:  state is FavoriteLoading ? CustomLoading(size: 10.r, strokeWidth: 2.r, color: AppColors.cardColorLight) :
          Icon(isFav ? Icons.bookmark_rounded : Icons.bookmark_border_rounded, color: AppColors.cardColorLight,),
        );
      },
    );
  }
}