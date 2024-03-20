import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:z_mart/common/widgets/appbar/appbar.dart';

import '../../../../common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../../utils/constants/sizes.dart ';

class LoadDataScreen extends StatelessWidget {
  const LoadDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ZAppBar(
        title: Text('Upload Dummy Data'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ZSizes.defaultSpace),
          child: Column(
            children: [
              ZSettingsMenuTile(
                icon: Iconsax.category_25,
                title: 'Upload Categories',
                subTitle: 'Upload dummy categories',
                trailing: Icon(Iconsax.arrow_up_1),
                // onTap: controller.uploadUserProfilePicture(),
              ),
              ZSettingsMenuTile(
                icon: Iconsax.shopping_cart5,
                title: 'Upload Products',
                subTitle: 'Add products to e-commerce site',
                trailing: Icon(Iconsax.arrow_up_1),
                // onTap: () {},
              ),
              ZSettingsMenuTile(
                icon: Iconsax.image5,
                title: 'Upload Banners',
                subTitle: 'Upload Products of featured products',
                trailing: Icon(Iconsax.arrow_up_1),
                // onTap: () {},
              ),
              ZSettingsMenuTile(
                icon: Iconsax.shop5,
                title: 'Upload Brands',
                subTitle: 'Upload brand names',
                trailing: Icon(Iconsax.arrow_up_1),
                // onTap: () {},
              ),
              SizedBox(height: ZSizes.spaceBtwSections * 2.5),
            ],
          ),
        ),
      ),
    );
  }
}
