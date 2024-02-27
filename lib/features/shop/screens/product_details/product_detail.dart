import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:z_mart/common/widgets/texts/section_heading.dart';
import 'package:z_mart/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:z_mart/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:z_mart/features/shop/screens/product_details/widgets/product_image_slider.dart';
import 'package:z_mart/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:z_mart/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:z_mart/utils/constants/sizes.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const ZBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///1. Product Image Slide
            const ZProductImageSlider(),

            ///2. Product Properties
            Padding(
              padding: const EdgeInsets.only(
                  right: ZSizes.defaultSpace,
                  left: ZSizes.defaultSpace,
                  bottom: ZSizes.defaultSpace),
              child: Column(
                children: [
                  ///--Rating and share
                  const ZRatingAndShare(),

                  ///--Price title stock and brand
                  const ZProductMetaData(),

                  ///-- Attributes
                  const ZProductAttributes(),

                  ///-- Checkout Button
                  const SizedBox(
                    height: ZSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Checkout'),
                    ),
                  ),
                  const SizedBox(
                    height: ZSizes.spaceBtwSections,
                  ),

                  ///-- description
                  const ZSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: ZSizes.spaceBtwItems,
                  ),
                  const ReadMoreText(
                    'This is a product description that can be collapsed and read more information about the product. This is a product description that can be collapsed and read more information about the product.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  ///-- reviews
                  const Divider(),
                  const SizedBox(
                    height: ZSizes.spaceBtwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const ZSectionHeading(
                          title: 'Reviews (190)', showActionButton: false),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Iconsax.arrow_right_3,
                            size: 18,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: ZSizes.spaceBtwSections,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
