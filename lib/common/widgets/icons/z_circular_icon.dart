import 'package:flutter/material.dart';
import 'package:z_mart/utils/constants/sizes.dart';

import '../../../utils/constants/colors.dart';

class ZCircularIcon extends StatelessWidget {
  const ZCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = ZSizes.lg,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width;
  final double? height;
  final double? size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null
            ? ZColors.black.withOpacity(0.9)
            : ZColors.white.withOpacity(0.9),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: color,
          size: size,
        ),
      ),
    );
  }
}
