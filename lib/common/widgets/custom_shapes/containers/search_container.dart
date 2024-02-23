import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ZSearchContainer extends StatelessWidget {
  const ZSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final bool darkMode = ZHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: ZSizes.defaultSpace),
        child: Container(
          width: ZDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(ZSizes.md),
          decoration: BoxDecoration(
            color: showBackground
                ? darkMode
                    ? ZColors.dark
                    : ZColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(ZSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: ZColors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: ZColors.grey,
              ),
              const SizedBox(width: ZSizes.spaceBtwItems),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
