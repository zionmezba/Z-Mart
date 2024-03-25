import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:z_mart/common/styles/rounded_container.dart';
import 'package:z_mart/common/widgets/images/z_rounded_image.dart';
import 'package:z_mart/features/shop/controllers/product/product_controller.dart';
import 'package:z_mart/features/shop/models/product_model.dart';
import 'package:z_mart/features/shop/screens/product_details/product_detail.dart';
import 'package:z_mart/utils/constants/colors.dart';
import 'package:z_mart/utils/constants/enums.dart';
import 'package:z_mart/utils/constants/sizes.dart';
import 'package:z_mart/utils/helpers/helper_functions.dart';

import '../../../styles/shadows.dart';
import '../../icons/z_circular_icon.dart';
import '../../texts/brand_title_text_with_verified_icon.dart';
import '../../texts/product_title_text.dart';
import '../product_price.dart';

class ZProductCardVertical extends StatelessWidget {
  const ZProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = ZHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetail(
            product: product,
          )),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [ZShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(ZSizes.productImageRadius),
          color: dark ? ZColors.darkerGrey : ZColors.white,
        ),
        child: Column(
          children: [
            ///Thumbnail wish discount tag
            ZRoundedContainer(
              height: 180,
              width: 180,
              padding: const EdgeInsets.all(ZSizes.sm),
              backgroundColor: dark ? ZColors.black : ZColors.white,
              child: Stack(
                children: [
                  ///Thumbnail Image
                  Center(
                    child: ZRoundedImage(
                      imageUrl: product.thumbnail,
                      applyImageRadius: true,
                      isNetworkImage: true,
                    ),
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
                        '$salePercentage%',
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
            const SizedBox(
              height: ZSizes.spaceBtwItems / 2,
            ),

            ///Details
            Padding(
              padding: const EdgeInsets.only(left: ZSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ZProductTitleText(
                    title: product.title,
                    smallSize: true,
                  ),
                  const SizedBox(
                    height: ZSizes.spaceBtwItems / 2,
                  ),
                  ZBrandTitleTextVerifiedIcon(
                    title: product.brand!.name,
                  ),
                ],
              ),
            ),

            const Spacer(),

            ///Price Row-----
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///Price---
                Flexible(
                  child: Column(
                    children: [
                      if (product.productType ==
                              ProductType.single.toString() &&
                          product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: ZSizes.sm),
                          child: Text(
                            product.price.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),

                      ///Price  show sale as main price if sale exists
                      Padding(
                        padding: const EdgeInsets.only(left: ZSizes.sm),
                        child: ZProductPriceText(
                          price: controller.getProductPrice(product),
                        ),
                      ),
                    ],
                  ),
                ),

                ///Add to cart---
                Container(
                  decoration: const BoxDecoration(
                    color: ZColors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(ZSizes.cardRadiusMd),
                      bottomRight: Radius.circular(ZSizes.productImageRadius),
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
            )
          ],
        ),
      ),
    );
  }
}
