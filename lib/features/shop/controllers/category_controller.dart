import 'package:get/get.dart';
import 'package:z_mart/common/widgets/loaders/loaders.dart';
import 'package:z_mart/data/repositories/categories/category_repository.dart';

import '../models/category_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// -- Load Category data
  Future<void> fetchCategories() async {
    try {
      ///Show loader while loading
      isLoading.value = true;

      ///Fetch categories from firebase
      final categories = await _categoryRepository.getAllCategories();

      ///update cat list
      allCategories.assignAll(categories);

      ///filter featured cats
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      ZLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      //   Remove loader
      isLoading.value = false;
    }
  }

  /// -- Load selected Category data

  /// -- Get category and sub category products
}
