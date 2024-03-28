import 'package:flutter/material.dart';
import 'package:z_mart/common/widgets/appbar/appbar.dart';
import 'package:z_mart/utils/constants/sizes.dart%20';

import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/products/sortable/sortable_products.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ZAppBar(
        title: Text('Nike'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ZSizes.defaultSpace),
          child: Column(
            children: [
              ZBrandCard(showBorder: true),
              SizedBox(height: ZSizes.spaceBtwSections),
              ZSortableProducts(products: [],),
            ],
          ),
        ),
      ),
    );
  }
}
