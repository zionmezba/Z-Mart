import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:z_mart/common/widgets/appbar/appbar.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/sizes.dart ';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../utils/validators/validator.dart';
import '../../controllers/add_product_controller.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddProductController());
    final dark = ZHelperFunctions.isDarkMode(context);

    return Scaffold(
        appBar: const ZAppBar(
          title: Text('Add Product'),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(ZSizes.defaultSpace),
            child: Column(
              children: [
                Form(
                  key: controller.productFormKey,
                  child: Column(
                    children: [
                      ///Product Picture
                      SizedBox(
                        width: double.infinity,
                        child: GestureDetector(
                          onTap: () => controller.selectProductThumb(),
                          child: Column(
                            children: [
                              Obx(() {
                                return controller.isSelectedThumb.isTrue
                                    ? Image.file(
                                        File(controller.pickedThumb!.path))
                                    : const Icon(Iconsax.add_circle, size: 40);
                              }),
                              const SizedBox(height: ZSizes.spaceBtwItems * 2),
                              Text('Select Product Thumbnail',
                                  style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: ZSizes.spaceBtwItems * 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () => controller.selectProductImg1(),
                              child: Column(
                                children: [
                                  Obx(() {
                                    return controller.isSelected_1.isTrue
                                        ? Image.file(
                                            File(controller.pickedImage_1!.path))
                                        : const Icon(Iconsax.add_circle,
                                            size: 30);
                                  }),
                                  const SizedBox(height: ZSizes.spaceBtwItems),
                                  Text('Select More Images',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: ZSizes.md),
                          Flexible(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () => controller.selectProductImg2(),
                              child: Column(
                                children: [
                                  Obx(() {
                                    return controller.isSelected_2.isTrue
                                        ? Image.file(
                                            File(controller.pickedImage_2!.path))
                                        : const Icon(Iconsax.add_circle,
                                            size: 30);
                                  }),
                                  const SizedBox(height: ZSizes.spaceBtwItems),
                                  Text('Select More Images',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      ///------Details-----
                      const SizedBox(height: ZSizes.spaceBtwItems / 2),
                      const Divider(),
                      const SizedBox(height: ZSizes.spaceBtwItems),

                      ///Product Name
                      TextFormField(
                        controller: controller.productTitle,
                        validator: (value) => ZValidator.validateEmptyText(
                            'Product Title', value),
                        decoration: InputDecoration(
                            floatingLabelStyle: TextStyle(
                                color: dark ? Colors.white : Colors.black),
                            prefixIcon: const Icon(Iconsax.shopping_bag),
                            labelText: 'Product Title'),
                      ),

                      const SizedBox(height: ZSizes.spaceBetweenInputFields),

                      ///Product Description
                      TextFormField(
                        controller: controller.productDesc,
                        validator: (value) => ZValidator.validateEmptyText(
                            'Product Description', value),
                        decoration: InputDecoration(
                            floatingLabelStyle: TextStyle(
                                color: dark ? Colors.white : Colors.black),
                            prefixIcon: const Icon(Iconsax.note),
                            labelText: 'Product Description'),
                      ),
                      const SizedBox(height: ZSizes.spaceBetweenInputFields),

                      ///Product Price
                      TextFormField(
                        controller: controller.productPrice,
                        validator: (value) => ZValidator.validateEmptyText(
                            'Product Price', value),
                        decoration: InputDecoration(
                            floatingLabelStyle: TextStyle(
                                color: dark ? Colors.white : Colors.black),
                            prefixIcon: const Icon(Iconsax.dollar_circle),
                            labelText: 'Product Price'),
                      ),
                      const SizedBox(height: ZSizes.spaceBetweenInputFields),

                      ///Product Sale Price
                      TextFormField(
                        controller: controller.productSalePrice,
                        validator: (value) =>
                            ZValidator.validateEmptyText('Product Sale', value),
                        decoration: InputDecoration(
                            floatingLabelStyle: TextStyle(
                                color: dark ? Colors.white : Colors.black),
                            prefixIcon: const Icon(Iconsax.discount_circle),
                            labelText: 'Product Sale Price'),
                      ),
                      const SizedBox(height: ZSizes.spaceBetweenInputFields),

                      ///Product Stock
                      TextFormField(
                        controller: controller.productStock,
                        validator: (value) => ZValidator.validateEmptyText(
                            'Product Stock', value),
                        decoration: InputDecoration(
                            floatingLabelStyle: TextStyle(
                                color: dark ? Colors.white : Colors.black),
                            prefixIcon: const Icon(Iconsax.forward_item),
                            labelText: 'Product Stock'),
                      ),
                      const SizedBox(height: ZSizes.spaceBetweenInputFields),

                      ///Featured
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Featured Product?'),
                          Obx(
                            () => Checkbox(
                                value: controller.isFeatured.value,
                                onChanged: (value) => controller.isFeatured
                                    .value = !controller.isFeatured.value),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: ZSizes.spaceBtwItems,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () => controller.saveProduct(),
                          child: const Text('Save'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
