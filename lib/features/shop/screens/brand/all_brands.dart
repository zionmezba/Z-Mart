import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:z_mart/common/widgets/appbar/appbar.dart';
import 'package:z_mart/common/widgets/brands/brand_card.dart';
import 'package:z_mart/common/widgets/layouts/grid_layout.dart';
import 'package:z_mart/common/widgets/texts/section_heading.dart';
import 'package:z_mart/features/shop/screens/brand/brand_products.dart';
import 'package:z_mart/utils/constants/sizes.dart%20';

import '../../../../common/widgets/loaders/brand_shimmers.dart';
import '../../controllers/brand_controller.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BrandController());
    return Scaffold(
      appBar: const ZAppBar(title: Text('All Brands'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Column(
            children: [
              ///Headings
              const ZSectionHeading(
                title: 'Brands',
                showActionButton: false,
              ),
              const SizedBox(height: ZSizes.spaceBtwSections),

              ///Products
              Obx(() {
                if (controller.isLoading.value) {
                  return const ZBrandShimmer();
                }

                if (controller.allBrands.isEmpty) {
                  return Center(
                      child: Text('No Data Found!',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .apply(color: Colors.white)));
                }
                return ZGridLayout(
                  itemCount: controller.allBrands.length,
                  mainAxisExtent: 80,
                  itemBuilder: (_, index) {
                    final brand = controller.allBrands[index];
                    return ZBrandCard(
                        showBorder: false,
                        brand: brand,
                        onTap: () => Get.to(() => BrandProducts(brand: brand)));
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
