import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:z_mart/common/widgets/appbar/appbar.dart';
import 'package:z_mart/common/widgets/appbar/tabbbar.dart';
import 'package:z_mart/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:z_mart/common/widgets/layouts/grid_layout.dart';
import 'package:z_mart/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:z_mart/common/widgets/texts/section_heading.dart';
import 'package:z_mart/features/shop/controllers/brand_controller.dart';
import 'package:z_mart/features/shop/screens/brand/all_brands.dart';
import 'package:z_mart/features/shop/screens/store/widgets/category_tab.dart';
import 'package:z_mart/utils/constants/colors.dart';
import 'package:z_mart/utils/constants/sizes.dart';
import 'package:z_mart/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/loaders/brand_shimmers.dart';
import '../../controllers/category_controller.dart';
import '../cart/cart.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = ZHelperFunctions.isDarkMode(context);
    final controller = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;

    return DefaultTabController(
      length: categories.length,
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
                      Obx(() {
                        if (controller.isLoading.value) {
                          return const ZBrandShimmer();
                        }

                        if (controller.featuredBrands.isEmpty) {
                          return Center(
                              child: Text('No Data Found!',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .apply(color: Colors.white)));
                        }
                        return ZGridLayout(
                          itemCount: controller.featuredBrands.length,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            final brand = controller.featuredBrands[index];
                            return ZBrandCard(showBorder: false, brand: brand);
                          },
                        );
                      }),
                    ],
                  ),
                ),

                ///--------List of tabs------
                bottom: ZTabBar(
                    tabs: categories
                        .map((category) => Tab(child: Text(category.name)))
                        .toList()),
              ),
            ];
          },
          body: TabBarView(
            children: categories
                .map((category) => ZCategoryTab(category: category))
                .toList(),
          ),
        ),
      ),
    );
  }
}
