import 'package:flutter/material.dart';
import 'package:z_mart/utils/constants/colors.dart';
import 'package:z_mart/utils/constants/sizes.dart';

class ZRoundedContainer extends StatelessWidget {
  const ZRoundedContainer(
      {super.key,
      this.width,
      this.height,
      this.radius = ZSizes.cardRadiusLg,
      this.child,
      this.showBorder = false,
      this.borderColor = ZColors.borderPrimary,
      this.backgroundColor = ZColors.light,
      this.padding,
      this.margin});

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      // BoxDecoration
      child: child,
    ); // Container
  }
}
