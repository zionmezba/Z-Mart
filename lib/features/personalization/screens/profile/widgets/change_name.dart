import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:z_mart/common/widgets/appbar/appbar.dart';
import 'package:z_mart/features/personalization/controllers/update_name_controller.dart';
import 'package:z_mart/utils/constants/sizes.dart';
import 'package:z_mart/utils/constants/text_strings.dart';
import 'package:z_mart/utils/helpers/helper_functions.dart';
import 'package:z_mart/utils/validators/validator.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: ZAppBar(
        title: Text('Change Name',
            style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(ZSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Headings
            Text(
              'Use real name for easy verification',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: ZSizes.spaceBtwSections),

            /// Form and button
            Form(
              key: controller.updateUsernameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        ZValidator.validateEmptyText('First Name', value),
                    expands: false,
                    decoration: InputDecoration(
                      floatingLabelStyle:
                          TextStyle(color: dark ? Colors.white : Colors.black),
                      labelText: ZTexts.firstName,
                      prefixIcon: const Icon(Iconsax.user),
                    ),
                  ),
                  const SizedBox(height: ZSizes.spaceBetweenInputFields),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) =>
                        ZValidator.validateEmptyText('Last Name', value),
                    expands: false,
                    decoration: InputDecoration(
                      floatingLabelStyle:
                          TextStyle(color: dark ? Colors.white : Colors.black),
                      labelText: ZTexts.lastName,
                      prefixIcon: const Icon(Iconsax.user),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: ZSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateUserName(),
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
