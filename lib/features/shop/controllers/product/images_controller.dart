import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:z_mart/features/shop/models/product_model.dart';
import 'package:z_mart/utils/constants/sizes.dart%20';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  RxString selectedProductImage = ''.obs;

  List<String> getAllProductImages(ProductModel product) {
    // set to add unique images
    Set<String> images = {};

    //load thumb images
    images.add(product.thumbnail);

    //assign thumb as selected
    selectedProductImage.value = product.thumbnail;

    //get all images from product model if not null
    if (product.images != null) {
      images.addAll(product.images!);
    }

    //get all images from product variations if not null
    if (product.productVariations != null ||
        product.productVariations!.isNotEmpty) {
      images.addAll(
          product.productVariations!.map((variation) => variation.image));
    }
    return images.toList();
  }

  /// show image popup
  void showEnlargedImage(String image) {
    Get.to(
        fullscreenDialog: true,
        () => Dialog.fullscreen(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: ZSizes.defaultSpace * 2,
                          horizontal: ZSizes.defaultSpace),
                      child: CachedNetworkImage(imageUrl: image)),
                  const SizedBox(height: ZSizes.spaceBtwItems),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 150,
                      child: OutlinedButton(
                          onPressed: () => Get.back(),
                          child: const Text('Close')),
                    ),
                  )
                ],
              ),
            ));
  }
}
