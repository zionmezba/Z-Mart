import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:z_mart/common/widgets/appbar/appbar.dart';
import 'package:z_mart/common/widgets/loaders/vertical_product_shimmer.dart';
import 'package:z_mart/utils/constants/sizes.dart%20';
import 'package:z_mart/utils/helpers/cloud_helper_functions.dart';

import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../controllers/all_product_controller.dart';
import '../../models/product_model.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen(
      {super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());

    return Scaffold(
      appBar:
          const ZAppBar(title: Text('Popular Products'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: FutureBuilder(
              future: futureMethod ?? controller.fetchProductsByQuery(query),
              builder: (context, snapshot) {
                const loader = ZVerticalProductShimmer();
                final widget = ZCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot, loader: loader);
                if(widget != null) return widget;

                final products = snapshot.data!;

                return ZSortableProducts(products: products);
              }),
        ),
      ),
    );
  }
}
