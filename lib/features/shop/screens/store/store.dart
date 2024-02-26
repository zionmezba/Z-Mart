import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:z_mart/common/styles/rounded_container.dart';
import 'package:z_mart/common/widgets/appbar/appbar.dart';
import 'package:z_mart/common/widgets/appbar/tabbbar.dart';
import 'package:z_mart/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:z_mart/common/widgets/layouts/grid_layout.dart';
import 'package:z_mart/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:z_mart/common/widgets/texts/section_heading.dart';
import 'package:z_mart/features/shop/screens/store/widgets/category_tab.dart';
import 'package:z_mart/utils/constants/colors.dart';
import 'package:z_mart/utils/constants/enums.dart';
import 'package:z_mart/utils/constants/image_strings.dart';
import 'package:z_mart/utils/constants/sizes.dart';
import 'package:z_mart/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/brands/brand_showcase.dart';
import '../../../../common/widgets/images/z_circular_image.dart';
import '../../../../common/widgets/texts/brand_title_text_with_verified_icon.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        ///-------App bar---
        appBar: ZAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [ZCartCounterIcon(onPressed: () {})],
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
                        onPressed: () {},
                      ),
                      const SizedBox(
                        height: ZSizes.spaceBtwItems / 1.5,
                      ),
                      ZGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return ZBrandCard(showBorder: false);
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
          body: TabBarView(
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
