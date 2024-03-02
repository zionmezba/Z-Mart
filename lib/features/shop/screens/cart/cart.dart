import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:z_mart/common/widgets/appbar/appbar.dart';
import 'package:z_mart/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:z_mart/utils/constants/sizes.dart%20';
import 'package:z_mart/utils/constants/text_strings.dart';

import '../checkout/checkout.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ZAppBar(
          showBackArrow: true,
          title: Text("Your Cart",
              style: Theme.of(context).textTheme.headlineSmall)),
      body: const Padding(
          padding: EdgeInsets.all(ZSizes.defaultSpace),

          ///---  Items in cart
          child: ZCartItems()),

      ///Bottom nav checkout
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(ZSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => const CheckoutScreen()),
          child: const Text('Checkout ${ZTexts.currencyBDT}980'),
        ),
      ),
    );
  }
}
