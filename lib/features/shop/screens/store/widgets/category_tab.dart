import 'package:flutter/material.dart';
import 'package:z_mart/common/widgets/layouts/grid_layout.dart';
import 'package:z_mart/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:z_mart/common/widgets/texts/section_heading.dart';
import 'package:z_mart/features/shop/models/category_model.dart';
import 'package:z_mart/features/shop/models/product_model.dart';

import '../../../../../common/widgets/brands/brand_showcase.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class ZCategoryTab extends StatelessWidget {
  const ZCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Column(
            children: [
              ///-------Brands----
              const ZBrandShowcase(
                images: [
                  ZImages.productImage1,
                  ZImages.productImage2,
                  ZImages.productImage3
                ],
              ),
              const ZBrandShowcase(
                images: [
                  ZImages.productImage1,
                  ZImages.productImage2,
                  ZImages.productImage3
                ],
              ),
              const SizedBox(
                height: ZSizes.spaceBtwItems,
              ),

              ///-----Products----
              ZSectionHeading(
                title: 'You might like',
                onPressed: () {},
              ),
              const SizedBox(
                height: ZSizes.spaceBtwItems,
              ),

              ZGridLayout(
                itemCount: 4,
                itemBuilder: (_, index) => ZProductCardVertical(
                  product: ProductModel.empty(),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
