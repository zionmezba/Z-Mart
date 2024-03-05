import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:z_mart/common/widgets/appbar/appbar.dart';
import 'package:z_mart/common/widgets/appbar/tabbbar.dart';
import 'package:z_mart/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:z_mart/common/widgets/layouts/grid_layout.dart';
import 'package:z_mart/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:z_mart/common/widgets/texts/section_heading.dart';
import 'package:z_mart/features/shop/screens/brand/all_brands.dart';
import 'package:z_mart/features/shop/screens/store/widgets/category_tab.dart';
import 'package:z_mart/utils/constants/colors.dart';
import 'package:z_mart/utils/constants/sizes.dart';
import 'package:z_mart/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/brands/brand_card.dart';
import '../cart/cart.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = ZHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        ///-------App bar---
        appBar: ZAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            ZCartCounterIcon(
              onPressed: () => Get.to(() => const CartScreen()),
              iconColor: ZColors.white,
            )
          ],
        ),

        ///----- Scroll view with two section nested scrolls----
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxScrolled) {
            return [
              ///---------Top Scroll view with popular brands---------
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: ZHelperFunctions.isDarkMode(context)
                    ? ZColors.black
                    : ZColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(ZSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(
                        height: ZSizes.spaceBtwItems,
                      ),
                      const ZSearchContainer(
                        text: 'Search in Store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(
                        height: ZSizes.spaceBtwSections,
                      ),

                      ///------Featured Brands----------
                      ZSectionHeading(
                        title: 'Featured Brands',
                        onPressed: () => Get.to(() => const AllBrandsScreen()),
                      ),
                      const SizedBox(
                        height: ZSizes.spaceBtwItems / 1.5,
                      ),
                      ZGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return const ZBrandCard(showBorder: false);
                        },
                      ),
                    ],
                  ),
                ),

                ///--------List of tabs------
                bottom: const ZTabBar(
                  tabs: [
                    Tab(
                      child: Text('Sports'),
                    ),
                    Tab(
                      child: Text('Furniture'),
                    ),
                    Tab(
                      child: Text('Electronics'),
                    ),
                    Tab(
                      child: Text('Cloths'),
                    ),
                    Tab(
                      child: Text('Cosmetics'),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              ZCategoryTab(),
              ZCategoryTab(),
              ZCategoryTab(),
              ZCategoryTab(),
              ZCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
