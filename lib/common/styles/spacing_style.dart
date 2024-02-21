import 'package:flutter/cupertino.dart';
import 'package:z_mart/utils/constants/sizes.dart';

class ZSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppbarHeight = EdgeInsets.only(
    top: ZSizes.appBarHeight,
    left: ZSizes.defaultSpace,
    bottom: ZSizes.defaultSpace,
    right: ZSizes.defaultSpace,
  );
}