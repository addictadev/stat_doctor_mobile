// import 'package:stat_doctor/core/constant/app_colors.dart';
// import 'package:stat_doctor/core/constant/styles/styles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class DocTypeCard extends StatelessWidget {
//   final Color? cardColor;
//   final Function() onTap;
//   final bool selected;
//   final String title;
//   const DocTypeCard({super.key, required this.onTap, required this.selected, required this.title, this.cardColor});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       splashColor: Colors.transparent,
//       highlightColor: Colors.transparent,
//       splashFactory: NoSplash.splashFactory,
//       onTap: onTap,
//       child: AnimatedContainer(
//         duration: 300.ms,
//         curve: Curves.easeInOut,
//         alignment: Alignment.center,
//         padding: EdgeInsets.symmetric(horizontal: 15.w,),
//         decoration: BoxDecoration(
//           color: selected ? Theme.of(context).primaryColor : (cardColor ?? Theme.of(context).scaffoldBackgroundColor),
//           borderRadius: BorderRadius.circular(250.r)
//         ),
//         child: Text(title, style: TextStyles.textViewRegular12.copyWith(color: selected ? AppColors.cardColorLight : null))
//       ),
//     );
//   }
// }