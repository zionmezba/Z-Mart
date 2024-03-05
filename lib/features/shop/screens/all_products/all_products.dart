import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:z_mart/common/widgets/appbar/appbar.dart';
import 'package:z_mart/common/widgets/layouts/grid_layout.dart';
import 'package:z_mart/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:z_mart/utils/constants/sizes.dart%20';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ZAppBar(title: Text('All Products'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Column(
            children: [
              DropdownButtonFormField(
                onChanged: (value) {},
                decoration:
                    const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
                items: ['Name', 'Higher Price', 'Sale', 'Newest', 'Popularity']
                    .map((option) =>
                        DropdownMenuItem(value: option, child: Text(option)))
                    .toList(),
              ),
              const SizedBox(height: ZSizes.spaceBtwSections),

              ///Products
              ZGridLayout(
                  itemCount: 10,
                  itemBuilder: (_, index) => const ZProductCardVertical())
            ],
          ),
        ),
      ),
    );
  }
}
