import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:z_mart/features/personalization/screens/upload_data/upload_data.dart';
import 'package:z_mart/features/shop/models/brand_model.dart';
import 'package:z_mart/features/shop/models/product_model.dart';
import 'package:z_mart/utils/constants/enums.dart';

import '../../../common/widgets/loaders/loaders.dart';
import '../../../data/repositories/data_loader/data_loader_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';

class AddProductController extends GetxController {
  static AddProductController get instance => Get.find();

  final dataLoaderRepository = Get.put(DataLoaderRepository());

  final isSelectedThumb = false.obs;
  final isSelected_1 = false.obs;
  final isSelected_2 = false.obs;
  final isFeatured = false.obs;
  final productTitle = TextEditingController();
  final productDesc = TextEditingController();
  final productPrice = TextEditingController();
  final productSalePrice = TextEditingController();
  final productStock = TextEditingController();
  XFile? pickedImage_1, pickedImage_2, pickedThumb;

  Rx<ProductModel> product = ProductModel.empty().obs;
  GlobalKey<FormState> productFormKey = GlobalKey<FormState>();

  ///Upload prod thumb
  void selectProductThumb() async {
    try {
      pickedThumb = (await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 80,
          maxHeight: 550,
          maxWidth: 550))!;
      isSelectedThumb.value = true;
    } catch (e) {
      ZLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {}
  }

  ///Upload prod img1
  void selectProductImg1() async {
    try {
      pickedImage_1 = (await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 80,
          maxHeight: 550,
          maxWidth: 550))!;
      isSelected_1.value = true;
    } catch (e) {
      ZLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {}
  }

  ///Upload prod img2
  void selectProductImg2() async {
    try {
      pickedImage_2 = (await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 80,
          maxHeight: 550,
          maxWidth: 550))!;
      isSelected_2.value = true;
    } catch (e) {
      ZLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {}
  }

  int generateUniqueNumber() {
    final random = Random();
    const min = 100000; // Minimum value for a 6-digit number (inclusive)
    const max = 999999; // Maximum value for a 6-digit number (exclusive)
    return min + random.nextInt(max - min + 1); // Generate random within range
  }

  String generateSKU(
      String categoryCode, String sizeCode, String colorCode, String uniqueId) {
    final unq = generateUniqueNumber().toString();
    return '$categoryCode-$sizeCode-$colorCode-$uniqueId-$unq';
  }

  ///Save Product
  Future<void> saveProduct() async {
    try {
      //Start Loading
      ZFullScreenLoader.openLoadingDialogue(
          'Saving Product...', ZImages.docerAnimation);

      //Check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        ZFullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if (!(productFormKey.currentState!.validate())) {
        ZFullScreenLoader.stopLoading();
        return;
      }
      final productId = generateSKU(
          'ZMRT',
          productTitle.value.text.substring(0, 3),
          productDesc.value.text.substring(0, 3),
          productStock.value.text.substring(0, 1));

      final urlThumb = await dataLoaderRepository.uploadImage(
          'Products/Images/$productId', pickedThumb!);
      final urlImg_1 = await dataLoaderRepository.uploadImage(
          'Products/Images/$productId', pickedImage_1!);
      final urlImg_2 = await dataLoaderRepository.uploadImage(
          'Products/Images/$productId', pickedImage_2!);
      List<String> images = [urlImg_1, urlImg_2];

      final product = ProductModel(
        id: productId,
        stock: int.parse(productStock.value.text),
        title: productTitle.value.text,
        description: productDesc.value.text,
        price: double.parse(productPrice.value.text),
        salePrice: double.parse(productSalePrice.value.text),
        thumbnail: urlThumb,
        images: images,
        productType: ProductType.single.toString(),
        brand: BrandModel(id: '1', name: 'Z-Mart', image: ''),
        categoryId: 'Random',
        date: Timestamp.now(),
        isFeatured: isFeatured.value,
        productAttributes: [],
        productVariations: [],
        sku: productId,
      );

      await dataLoaderRepository.saveProduct(product);

      ZFullScreenLoader.stopLoading();
      ZLoaders.successSnackBar(
          title: 'Success', message: 'Your category has been added!');

      //Redirect
      Get.off(const LoadDataScreen());
    } catch (e) {
      //remove loader
      ZFullScreenLoader.stopLoading();
      ZLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
