import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:iconsax/iconsax.dart';
import 'package:z_mart/common/widgets/appbar/appbar.dart';
import 'package:z_mart/common/widgets/custom_shapes/containers/circular_container.dart';
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
            ZPrimaryHeaderContainer(
              child: Column(
                children: [
                  // Appbar
                  const ZHomeAppbar(),
                  const SizedBox(
                    height: ZSizes.spaceBtwSections,
                  ),

                  // Search Bar
                  const ZSearchContainer(
                    text: "Search in Store",
                  ),
                  const SizedBox(
                    height: ZSizes.spaceBtwSections,
                  ),

                  // Category Container Scrollable
                  Padding(
                    padding: const EdgeInsets.only(left: ZSizes.defaultSpace),
                    child: Column(
                      children: [
                        const ZSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        const SizedBox(
                          height: ZSizes.spaceBtwItems,
                        ),

                        ///Scrollable Cats
                        ZHomeCategories(),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(ZSizes.defaultSpace),
                child: ZPromoSlider(banners: [ZImages.banner3,ZImages.banner1,ZImages.banner2],)),
          ],
        ),
      ),
    );
  }
}
