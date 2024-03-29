import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:z_mart/common/widgets/appbar/appbar.dart';
import 'package:z_mart/common/widgets/brands/brand_card.dart';
import 'package:z_mart/common/widgets/layouts/grid_layout.dart';
import 'package:z_mart/common/widgets/texts/section_heading.dart';
import 'package:z_mart/features/shop/models/brand_model.dart';
import 'package:z_mart/features/shop/screens/brand/brand_products.dart';
import 'package:z_mart/utils/constants/sizes.dart%20';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              ZGridLayout(
                  mainAxisExtent: 80,
                  itemCount: 10,
                  itemBuilder: (_, index) => ZBrandCard(
                        showBorder: true,
                        onTap: () => Get.to(() => const BrandProducts()), brand: BrandModel.empty(),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
