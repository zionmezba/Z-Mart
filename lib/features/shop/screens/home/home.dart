import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:z_mart/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:z_mart/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:z_mart/features/shop/screens/home/widgets/home_categories.dart';
import 'package:z_mart/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:z_mart/utils/constants/colors.dart';
import 'package:z_mart/utils/constants/sizes.dart';
import 'package:z_mart/utils/constants/text_strings.dart';
import 'package:z_mart/utils/device/device_utility.dart';
import 'package:z_mart/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/image_text/vertical_image_text.dart';
import '../../../../common/widgets/images/z_rounded_image.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                ],
              ),
            ),

            ///-------Product Section-------
            Padding(
              padding: const EdgeInsets.all(ZSizes.defaultSpace),
              child: Column(
                children: [
                  ///-------Carousel Image slider---------
                  const ZPromoSlider(
                    banners: [
                      ZImages.banner3,
                      ZImages.banner1,
                      ZImages.banner2
                    ],
                  ),
                  const SizedBox(
                    height: ZSizes.spaceBtwSections,
                  ),

                  /// --- Heading ---
                  ZSectionHeading(
                    title: 'Popular Products',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: ZSizes.spaceBtwItems,
                  ),

                  ///---------Products Cards---------
                  ZGridLayout(
                    itemCount: 6,
                    itemBuilder: (_, index) => const ZProductCardVertical(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
