import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart ';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/z_circular_icon.dart';

class ZProductQuantityAddRemove extends StatelessWidget {
  const ZProductQuantityAddRemove({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ZCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: ZSizes.md,
          color: ZHelperFunctions.isDarkMode(context)
              ? ZColors.white
              : ZColors.black,
          backgroundColor: ZHelperFunctions.isDarkMode(context)
              ? ZColors.darkerGrey
              : ZColors.light,
        ),
        const SizedBox(width: ZSizes.spaceBtwItems),
        Text('2', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: ZSizes.spaceBtwItems),
        const ZCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: ZSizes.md,
          color: ZColors.white,
          backgroundColor: ZColors.primary,
        ),
      ],
    );
  }
}
