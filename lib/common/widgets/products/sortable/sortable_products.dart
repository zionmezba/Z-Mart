import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:z_mart/features/shop/models/product_model.dart';
import 'package:get/get.dart';
import '../../../../features/shop/controllers/all_product_controller.dart';
import '../../../../utils/constants/sizes.dart ';
import '../../layouts/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class ZSortableProducts extends StatelessWidget {
  const ZSortableProducts({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());

    controller.assignProducts(products);
    return Column(
      children: [
        DropdownButtonFormField(
          value: controller.selectedSortOption.value,
          onChanged: (value) {
            controller.sortProducts(value!);
          },
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity'
          ]
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: ZSizes.spaceBtwSections),

        ///Products
        Obx(
          () => ZGridLayout(
            itemCount: controller.products.length,
            itemBuilder: (_, index) => ZProductCardVertical(
              product: controller.products[index],
            ),
          ),
        )
      ],
    );
  }
}
