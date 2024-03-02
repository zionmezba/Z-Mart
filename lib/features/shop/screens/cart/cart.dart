import 'package:flutter/material.dart';
import 'package:z_mart/common/widgets/appbar/appbar.dart';
import 'package:z_mart/common/widgets/products/product_price.dart';
import 'package:z_mart/utils/constants/sizes.dart%20';
import 'package:z_mart/utils/constants/text_strings.dart';

import '../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../common/widgets/products/cart/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ZAppBar(
          showBackArrow: true,
          title: Text("Your Cart",
              style: Theme.of(context).textTheme.headlineSmall)),
      body: Padding(
        padding: const EdgeInsets.all(ZSizes.defaultSpace),
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_, __) =>
              const SizedBox(height: ZSizes.spaceBtwSections),
          itemCount: 8,
          itemBuilder: (_, index) => const Column(
            children: [
              ZCartItem(),
              SizedBox(height: ZSizes.spaceBtwItems),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 70),

                      ///Add Remove Button
                      ZProductQuantityAddRemove(),
                    ],
                  ),
                  ZProductPriceText(price: '980')
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(ZSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Checkout ${ZTexts.currencyBDT}980'),
        ),
      ),
    );
  }
}
