import 'package:flutter/material.dart';
import 'package:z_mart/common/widgets/appbar/appbar.dart';
import 'package:z_mart/utils/constants/sizes.dart%20';
import 'package:get/get.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/loaders/vertical_product_shimmer.dart';
import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';
import '../../controllers/brand_controller.dart';
import '../../models/brand_model.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;

    return Scaffold(
      appBar: ZAppBar(
        title: Text(brand.name),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Column(
            children: [
              ZBrandCard(
                showBorder: true,
                brand: brand,
              ),
              const SizedBox(height: ZSizes.spaceBtwSections),
              FutureBuilder(
                  future: controller.getBrandProducts(brand.id),
                  builder: (context, snapshot) {
                    /// Handle Loader, No Record, OR Error Message
                    const loader = ZVerticalProductShimmer();
                    final widget = ZCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    /// Record Found!
                    final brandProducts = snapshot.data!;

                    return ZSortableProducts(products: brandProducts);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
