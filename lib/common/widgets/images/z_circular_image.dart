import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:z_mart/common/widgets/loaders/shimmer.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class ZCircularImage extends StatelessWidget {
  const ZCircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = ZSizes.sm,
  });

  final BoxFit fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ??
            (ZHelperFunctions.isDarkMode(context)
                ? ZColors.black
                : ZColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect( 
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  imageUrl: image,
                  fit: fit,
                  color: overlayColor,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const ZShimmerEffect(height: 55, width: 55),
                  errorWidget: (context, url, error) => const Icon(Icons.error))
              : Image(
                  fit: fit,
                  image: AssetImage(image),
                  color: overlayColor,
                ),
        ),
      ),
    );
  }
}
