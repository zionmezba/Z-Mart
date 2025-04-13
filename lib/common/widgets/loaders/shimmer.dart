import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:z_mart/utils/constants/colors.dart';
import 'package:z_mart/utils/helpers/helper_functions.dart';

class ZShimmerEffect extends StatelessWidget {
  const ZShimmerEffect(
      {super.key,
      required this.height,
      required this.width,
      this.radius = 15,
      this.color});

  final double height, width, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (dark ? ZColors.darkerGrey : ZColors.white),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
