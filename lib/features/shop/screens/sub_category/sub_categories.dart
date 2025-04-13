import 'package:flutter/material.dart';
import 'package:z_mart/common/widgets/appbar/appbar.dart';
import 'package:z_mart/common/widgets/images/z_rounded_image.dart';
import 'package:z_mart/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:z_mart/common/widgets/texts/section_heading.dart';
import 'package:z_mart/utils/constants/image_strings.dart';
import 'package:z_mart/utils/constants/sizes.dart%20';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ZAppBar(title: Text('Sports'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Column(
            children: [
              ///Banner
              const ZRoundedImage(
                imageUrl: ZImages.banner1,
                height: null,
                width: double.infinity,
                applyImageRadius: true,
              ),
              const SizedBox(
                height: ZSizes.spaceBtwSections,
              ),

              ///Sub Categories
              Column(
                children: [
                  // Heading
                  ZSectionHeading(
                    title: 'Sports Shirts',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: ZSizes.spaceBtwItems / 2,
                  ),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => const SizedBox(
                              width: ZSizes.spaceBtwItems,
                            ),
                        itemBuilder: (context, index) =>
                            const ZProductCardHorizontal()),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
