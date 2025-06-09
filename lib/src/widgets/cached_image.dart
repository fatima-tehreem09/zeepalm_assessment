import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../const/colors.dart';

class CachedImageWidget extends StatelessWidget {
  final String url;
  final double? size;
  final double? width;
  final double? borderRadius;
  final BorderRadius? radius;
  final BoxFit? fit;

  const CachedImageWidget({
    super.key,
    this.radius,
    this.width,
    this.borderRadius,
    required this.url,
    this.size,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.circular(borderRadius ?? size!),
      child: CachedNetworkImage(
        imageUrl: url.isEmpty
            ? "https://plus.unsplash.com/premium_photo-1726611969494-3e1ca8ae6d05?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
            : url,
        width: width ?? size,
        height: size,
        fit: fit ?? BoxFit.contain,
        imageBuilder: (context, imageProvider) => Image(
          image: imageProvider,
          fit: fit ?? BoxFit.contain,
        ),
        progressIndicatorBuilder: (context, url, progress) => SizedBox(
          width: 20,
          height: 20,
          child: Center(
            child: CircularProgressIndicator.adaptive(
              value: progress.progress,
              strokeCap: StrokeCap.round,
              strokeWidth: 4,
              backgroundColor: AppColors.primaryPink,
            ),
          ),
        ),
        errorWidget: (context, url, error) => const Center(
          child: Icon(
            Icons.image_not_supported_rounded,
          ),
        ),
      ),
    );
  }
}
