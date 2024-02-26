import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:z_mart/common/widgets/appbar/appbar.dart';
import 'package:z_mart/common/widgets/icons/z_circular_icon.dart';
import 'package:z_mart/common/widgets/layouts/grid_layout.dart';
import 'package:z_mart/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:z_mart/features/shop/screens/home/home.dart';
import 'package:z_mart/utils/constants/sizes.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ZAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          ZCircularIcon(
              icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen())),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Column(
            children: [
              ZGridLayout(
                  itemCount: 6,
                  itemBuilder: (_, index) => const ZProductCardVertical())
            ],
          ),
        ),
      ),
    );
  }
}
