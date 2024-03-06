import 'package:flutter/material.dart';
import 'package:z_mart/common/widgets/images/z_circular_image.dart';
import 'package:z_mart/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:z_mart/utils/constants/enums.dart';
import 'package:z_mart/utils/constants/image_strings.dart';
import 'package:z_mart/utils/helpers/helper_functions.dart';

import '../../../../../common/styles/rounded_container.dart';
import '../../../../../common/widgets/products/product_price.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart ';

class ZProductMetaData extends StatelessWidget {
  const ZProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Price sale price
        Row(
          children: [
            ///Sale tag
            ZRoundedContainer(
              radius: ZSizes.sm,
              backgroundColor: ZColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: ZSizes.sm, vertical: ZSizes.xs),
              child: Text(
                '25%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: ZColors.black),
              ),
            ),
            const SizedBox(
              width: ZSizes.spaceBtwItems,
            ),

            ///Price
            const ZProductPriceText(
              price: '1200',
              lineThrough: true,
            ),
            const SizedBox(
              width: ZSizes.spaceBtwItems,
            ),
            const ZProductPriceText(
              price: '980',
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(
          height: ZSizes.spaceBtwItems / 1.5,
        ),

        ///title
        const ZProductTitleText(
          title: 'Green Nike Sports Shoes',
        ),
        const SizedBox(
          height: ZSizes.spaceBtwItems / 1.5,
        ),

        ///stock status
        Row(
          children: [
            const ZProductTitleText(
              title: 'Status',
            ),
            const SizedBox(
              width: ZSizes.spaceBtwItems,
            ),
            Text(
              'In Stock',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(
          height: ZSizes.spaceBtwItems / 1.5,
        ),

        ///Brand
        Row(
          children: [
            ZCircularImage(
              image: ZImages.shoeIcon,
              height: 32,
              width: 32,
              overlayColor: dark ? ZColors.white : ZColors.black,
            ),
            const ZBrandTitleTextVerifiedIcon(
              title: 'Nike',
              brandTextSize: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}
