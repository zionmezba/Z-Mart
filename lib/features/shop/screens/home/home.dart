import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:z_mart/common/widgets/loaders/vertical_product_shimmer.dart';
import 'package:z_mart/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:z_mart/features/shop/screens/all_products/all_products.dart';
import 'package:z_mart/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:z_mart/features/shop/screens/home/widgets/home_categories.dart';
import 'package:z_mart/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:z_mart/utils/constants/sizes.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../controllers/product/product_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ZPrimaryHeaderContainer(
              child: Column(
                children: [
                  ///----- Appbar-----
                  ZHomeAppbar(),
                  SizedBox(
                    height: ZSizes.spaceBtwSections,
                  ),

                  ///------ Search Bar--------
                  ZSearchContainer(
                    text: "Search in Store",
                  ),
                  SizedBox(
                    height: ZSizes.spaceBtwSections,
                  ),

                  ///-------- Category Container Scrollable--------
                  Padding(
                    padding: EdgeInsets.only(left: ZSizes.defaultSpace),
                    child: Column(
                      children: [
                        ZSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        SizedBox(
                          height: ZSizes.spaceBtwItems,
                        ),

                        ///----Scrollable Categories--------
                        ZHomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ZSizes.spaceBtwSections,
                  )
                ],
              ),
            ),

            ///-------Product Section-------
            Padding(
              padding: const EdgeInsets.all(ZSizes.defaultSpace),
              child: Column(
                children: [
                  ///-------Carousel Image Promo slider---------
                  const ZPromoSlider(),
                  const SizedBox(
                    height: ZSizes.spaceBtwSections,
                  ),

                  /// --- Heading ---
                  ZSectionHeading(
                    title: 'Popular Products',
                    onPressed: () => Get.to(() => const AllProductsScreen()),
                  ),
                  const SizedBox(
                    height: ZSizes.spaceBtwItems,
                  ),

                  ///---------Popular - Products Cards---------
                  Obx(() {
                    //show loader
                    if (controller.isLoading.value) {
                      return const ZVerticalProductShimmer();
                    }
                    //If No Data Found
                    if (controller.featuredProducts.isEmpty) {
                      return Center(
                          child: Text('No Data Found!',
                              style: Theme.of(context).textTheme.bodyMedium));
                    } else {
                      return ZGridLayout(
                        itemCount: controller.featuredProducts.length,
                        itemBuilder: (_, index) => ZProductCardVertical(
                            product: controller.featuredProducts[index]),
                      );
                    }
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
