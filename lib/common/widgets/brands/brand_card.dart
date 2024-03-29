import 'package:flutter/material.dart';
import 'package:z_mart/features/shop/models/brand_model.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
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
    required this.brand,
  });

  final BrandModel brand;
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
                image: brand.image,
                isNetworkImage: true,
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
                    title: brand.name,
                    textColor: dark ? ZColors.white : ZColors.black,
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    '${brand.productsCount ?? 0} Products',
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
