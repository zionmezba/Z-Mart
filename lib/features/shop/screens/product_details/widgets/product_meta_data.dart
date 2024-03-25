import 'package:flutter/material.dart';
import 'package:z_mart/common/widgets/images/z_circular_image.dart';
import 'package:z_mart/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:z_mart/features/shop/controllers/product/product_controller.dart';
import 'package:z_mart/features/shop/models/product_model.dart';
import 'package:z_mart/utils/constants/enums.dart';
import 'package:z_mart/utils/helpers/helper_functions.dart';

import '../../../../../common/styles/rounded_container.dart';
import '../../../../../common/widgets/products/product_price.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart ';

class ZProductMetaData extends StatelessWidget {
  const ZProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);

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
                '$salePercentage%',
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
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              ZProductPriceText(
                price: '${product.price}',
                lineThrough: true,
              ),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              const SizedBox(
                width: ZSizes.spaceBtwItems,
              ),
            ZProductPriceText(
              price: controller.getProductPrice(product),
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(
          height: ZSizes.spaceBtwItems / 1.5,
        ),

        ///title
        ZProductTitleText(
          title: product.title,
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
              controller.getStockStatus(product.stock),
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
              isNetworkImage: true,
              image: product.brand != null ? product.brand!.image : '',
              height: 32,
              width: 32,
              overlayColor: dark ? ZColors.white : ZColors.black,
            ),
            ZBrandTitleTextVerifiedIcon(
              title: product.brand != null ? product.brand!.name : '',
              brandTextSize: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}
