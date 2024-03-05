import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart ';
import '../../layouts/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class ZSortableProducts extends StatelessWidget {
  const ZSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          onChanged: (value) {},
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
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
    );
  }
}
