import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:z_mart/common/widgets/appbar/appbar.dart';
import 'package:z_mart/common/widgets/loaders/vertical_product_shimmer.dart';
import 'package:z_mart/utils/constants/sizes.dart%20';

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
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return loader;
                }
                if (!snapshot.hasData ||
                    snapshot.data == null ||
                    snapshot.data!.isEmpty) {
                  return const Center(child: Text('No Data Found!'));
                }
                if (snapshot.hasError) {
                  return const Center(child: Text('Something went wrong!'));
                }

                final products = snapshot.data!;

                return ZSortableProducts(products: [],);
              }),
        ),
      ),
    );
  }
}
