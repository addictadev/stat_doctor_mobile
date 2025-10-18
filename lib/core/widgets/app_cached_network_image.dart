import 'package:cached_network_image/cached_network_image.dart';
import 'package:stat_doctor/core/config/app_images.dart';
import 'package:stat_doctor/core/widgets/app_shimmer.dart';
import 'package:stat_doctor/core/widgets/shimmer_shape.dart';
import 'package:flutter/material.dart';

class AppCachedNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final BoxFit fit;
  const AppCachedNetworkImage({super.key, required this.imageUrl, this.fit = BoxFit.cover});

  static ImageProvider getImageProvider(String imageUrl) {
    return CachedNetworkImageProvider(imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return imageUrl == null ? Image.asset(AppImages.logo, fit: fit,) : CachedNetworkImage(
      imageUrl: imageUrl!,
      fit: fit,
      errorWidget: (context, url, error) => Image.asset(AppImages.logo),
      progressIndicatorBuilder: (context, url, downloadProgress) => AppShimmer(child: ShimmerShape()),
      placeholderFadeInDuration: const Duration(milliseconds: 300),
      fadeOutDuration: Duration(milliseconds: 300),
      fadeInDuration: Duration(milliseconds: 300),
      fadeInCurve: Curves.easeInOut,
      fadeOutCurve: Curves.easeInOut,
    );
  }
}