import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:z_mart/common/widgets/loaders/loaders.dart';
import 'package:z_mart/data/repositories/product/product_repository.dart';
import 'package:z_mart/features/shop/models/product_model.dart';

class AllProductsController extends GetxController {
  static AllProductsController get instance => Get.find();

  final repository = ProductRepository.instance;
  final RxString selectedSortOption = 'Name'.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  Future<List<ProductModel>> fetchProductsByQuery(Query? query) async {
    try {
      if (query == null) return [];
      final products = await repository.fetchProductsByQuery(query);
      return products;
    } catch (e) {
      ZLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  void sortProducts(String sortOption){
    selectedSortOption.value = sortOption;
    switch(sortOption){
      case 'Name':

    }
  }
}
