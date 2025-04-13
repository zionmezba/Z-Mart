import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:z_mart/common/widgets/appbar/appbar.dart';
import 'package:z_mart/features/personalization/screens/upload_data/add_categories.dart';
import 'package:z_mart/features/personalization/screens/upload_data/add_product.dart';

import '../../../../common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../../utils/constants/sizes.dart ';

class LoadDataScreen extends StatelessWidget {
  const LoadDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ZAppBar(
        title: Text('Upload Dummy Data'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Column(
            children: [
              ZSettingsMenuTile(
                icon: Iconsax.category_25,
                title: 'Upload Categories',
                subTitle: 'Upload dummy categories',
                trailing: const Icon(Iconsax.arrow_up_1),
                onTap: () => Get.to(() => const AddCategoriesScreen()),
              ),
              ZSettingsMenuTile(
                icon: Iconsax.shopping_cart5,
                title: 'Upload Products',
                subTitle: 'Add products to e-commerce site',
                trailing: const Icon(Iconsax.arrow_up_1),
                onTap: () => Get.to(() => const AddProductScreen()),
              ),
              const ZSettingsMenuTile(
                icon: Iconsax.image5,
                title: 'Upload Banners',
                subTitle: 'Upload Products of featured products',
                trailing: Icon(Iconsax.arrow_up_1),
                // onTap: () {},
              ),
              const ZSettingsMenuTile(
                icon: Iconsax.shop5,
                title: 'Upload Brands',
                subTitle: 'Upload brand names',
                trailing: Icon(Iconsax.arrow_up_1),
                // onTap: () {},
              ),
              const SizedBox(height: ZSizes.spaceBtwSections * 2.5),
            ],
          ),
        ),
      ),
    );
  }
}
