import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/products/product_price.dart';
import '../../../../../utils/constants/sizes.dart ';

class ZCartItems extends StatelessWidget {
  const ZCartItems({super.key, this.showAddRmvButton = true});

  final bool showAddRmvButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) =>
          const SizedBox(height: ZSizes.spaceBtwSections),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [
          const ZCartItem(),

          if (showAddRmvButton) const SizedBox(height: ZSizes.spaceBtwItems),

          ///Add Remove Button
          if (showAddRmvButton)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 70),
                    ZProductQuantityAddRemove(),
                  ],
                ),
                ZProductPriceText(price: '980')
              ],
            )
        ],
      ),
    );
  }
}
