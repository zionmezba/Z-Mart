import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:z_mart/common/styles/rounded_container.dart';
import 'package:z_mart/common/widgets/images/z_rounded_image.dart';
import 'package:z_mart/utils/constants/colors.dart';
import 'package:z_mart/utils/constants/image_strings.dart';
import 'package:z_mart/utils/constants/sizes.dart';
import 'package:z_mart/utils/helpers/helper_functions.dart';

import '../../../styles/shadows.dart';
import '../../icons/z_circular_icon.dart';
import '../../texts/product_title_text.dart';
import '../product_price.dart';

class ZProductCardVertical extends StatelessWidget {
  const ZProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [ZShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(ZSizes.productImageRadius),
          color: dark ? ZColors.darkerGrey : ZColors.light,
        ),
        child: Column(
          children: [
            ///Thumbnail wish discount tag
            ZRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(ZSizes.sm),
              backgroundColor: dark ? ZColors.dark : ZColors.light,
              child: Stack(
                children: [
                  const ZRoundedImage(
                    imageUrl: ZImages.productImage1,
                    applyImageRadius: true,
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
                            .apply(color: ZColors.dark),
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
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: ZSizes.spaceBtwItems / 2,
            ),

            ///Details
            Padding(
              padding: const EdgeInsets.only(left: ZSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ZProductTitleText(
                    title: 'Green Nike Air Shoes',
                    smallSize: true,
                  ),
                  const SizedBox(
                    height: ZSizes.spaceBtwItems / 2,
                  ),
                  Row(
                    children: [
                      Text('Nike',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.labelMedium),
                      const SizedBox(
                        width: ZSizes.xs,
                      ),
                      const Icon(Iconsax.verify5,
                          color: ZColors.primary, size: ZSizes.iconXs)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const ZProductPriceText(price: '1200',isLarge: true,),
                      Container(
                        decoration: const BoxDecoration(
                          color: ZColors.dark,
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
                              color: ZColors.light,
                            ),
                          ),
                        ),
                      ),
                    ],
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
