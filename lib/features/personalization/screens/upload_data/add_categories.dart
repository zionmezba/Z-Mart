import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:z_mart/common/widgets/appbar/appbar.dart';
import 'package:z_mart/features/personalization/controllers/data_loader_controller.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/sizes.dart ';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../utils/validators/validator.dart';

class AddCategoriesScreen extends StatelessWidget {
  const AddCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DataLoaderController());
    final dark = ZHelperFunctions.isDarkMode(context);

    return Form(
      key: controller.categoryFormKey,
      child: Scaffold(
          appBar: const ZAppBar(
            title: Text('Add Category'),
            showBackArrow: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(ZSizes.defaultSpace),
              child: Column(
                children: [
                  Column(
                    children: [
                      ///Category Picture
                      SizedBox(
                        width: double.infinity,
                        child: GestureDetector(
                          onTap: () => controller.selectCategoryIcon(),
                          child: Column(
                            children: [
                              Obx(() {
                                return controller.isSelected.isTrue
                                    ? Image.file(
                                        File(controller.pickedImage!.path))
                                    : const Icon(Iconsax.add_circle, size: 40);
                              }),
                              const SizedBox(height: ZSizes.spaceBtwItems * 2),
                              Text('Select Category Icon',
                                  style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                        ),
                      ),

                      ///------Details-----
                      const SizedBox(height: ZSizes.spaceBtwItems / 2),
                      const Divider(),
                      const SizedBox(height: ZSizes.spaceBtwItems),

                      ///Category Name
                      TextFormField(
                        controller: controller.categoryName,
                        validator: (value) =>
                            ZValidator.validateEmptyText('Category', value),
                        decoration: InputDecoration(
                            floatingLabelStyle: TextStyle(
                                color: dark ? Colors.white : Colors.black),
                            prefixIcon: const Icon(Iconsax.category),
                            labelText: 'Category Title'),
                      ),

                      const SizedBox(
                        height: ZSizes.spaceBtwItems,
                      ),

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
                          onPressed: () => controller.saveCategory(),
                          child: const Text('Save'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
