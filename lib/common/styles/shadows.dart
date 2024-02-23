import 'package:flutter/cupertino.dart';
import 'package:z_mart/utils/constants/colors.dart';

class ZShadowStyle {
  static final verticalProductShadow = BoxShadow(
    color: ZColors.darkerGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );

  static final horizontalProductShadow = BoxShadow(
    color: ZColors.darkerGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}
