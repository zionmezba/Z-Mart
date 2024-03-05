import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:z_mart/common/styles/rounded_container.dart';
import 'package:z_mart/common/widgets/images/z_rounded_image.dart';
import 'package:z_mart/common/widgets/products/product_price.dart';
import 'package:z_mart/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:z_mart/features/shop/screens/product_details/widgets/product_title_text.dart';
import 'package:z_mart/utils/constants/image_strings.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart ';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/z_circular_icon.dart';

class ZProductCardHorizontal extends StatelessWidget {
  const ZProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ZSizes.productImageRadius),
        color: dark ? ZColors.darkerGrey : ZColors.softGrey,
      ),
      child: Row(
        children: [
          ///Thumbnail
          ZRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(ZSizes.sm),
            backgroundColor: dark ? ZColors.dark : ZColors.light,
            child: Stack(
              children: [
                // Thumbnail Image
                const SizedBox(
                  height: 120,
                  width: 120,
                  child: ZRoundedImage(
                      imageUrl: ZImages.productImage1, applyImageRadius: true),
                ),

                ///Sale tag
                Positioned(
                  top: 12,
                  child: ZRoundedContainer(
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
                ),

                ///Favourite Icon Button
                const Positioned(
                  top: 0,
                  right: 0,
                  child: ZCircularIcon(
                    icon: Iconsax.heart5,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),

          ///Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: ZSizes.sm, left: ZSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ZProductTitleText(
                        title: 'Green Nike Half Sleeves Shirt',
                        smallSize: true,
                      ),
                      SizedBox(height: ZSizes.spaceBtwItems / 2),
                      ZBrandTitleTextVerifiedIcon(title: 'Nike'),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ///Pricing
                      const Flexible(child: ZProductPriceText(price: '1200')),

                      ///Add to cart---
                      Container(
                        decoration: const BoxDecoration(
                          color: ZColors.black,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(ZSizes.cardRadiusMd),
                            bottomRight:
                                Radius.circular(ZSizes.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                          width: ZSizes.iconLg * 1.2,
                          height: ZSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(
                              Iconsax.add,
                              color: ZColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
