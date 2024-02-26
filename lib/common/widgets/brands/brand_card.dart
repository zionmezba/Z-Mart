import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../styles/rounded_container.dart';
import '../images/z_circular_image.dart';
import '../texts/brand_title_text_with_verified_icon.dart';

class ZBrandCard extends StatelessWidget {
  const ZBrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: ZRoundedContainer(
        padding: const EdgeInsets.all(ZSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            ///--Icon---
            Flexible(
              child: ZCircularImage(
                image: ZImages.clothIcon,
                isNetworkImage: false,
                backgroundColor: Colors.transparent,
                overlayColor: ZHelperFunctions.isDarkMode(context)
                    ? ZColors.white
                    : ZColors.black,
              ),
            ),
            const SizedBox(
              height: ZSizes.spaceBtwItems / 2,
            ),

            ///----Text---
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ZBrandTitleTextVerifiedIcon(
                    title: 'Nike',
                    textColor: dark ? ZColors.white : ZColors.black,
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    '256 Products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
