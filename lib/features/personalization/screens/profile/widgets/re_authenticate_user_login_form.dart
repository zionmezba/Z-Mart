import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:z_mart/features/personalization/controllers/user_controller.dart';
import 'package:z_mart/utils/constants/sizes.dart%20';
import 'package:z_mart/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validator.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    final controller = Get.put(UserController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Re-Authenticate User'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              children: [
                ///Email
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: (value) => ZValidator.validateEmail(value),
                  decoration: InputDecoration(
                      floatingLabelStyle:
                          TextStyle(color: dark ? Colors.white : Colors.black),
                      prefixIcon: const Icon(Iconsax.direct_right),
                      labelText: ZTexts.email),
                ),
                const SizedBox(
                  height: ZSizes.spaceBetweenInputFields,
                ),

                ///Password
                Obx(
                  () => TextFormField(
                    controller: controller.verifyPassword,
                    validator: (value) =>
                        ZValidator.validateEmptyText('Password', value),
                    obscureText: controller.hidePassword.value,
                    decoration: InputDecoration(
                      floatingLabelStyle:
                          TextStyle(color: dark ? Colors.white : Colors.black),
                      labelText: ZTexts.password,
                      suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value,
                        icon: Icon(controller.hidePassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye),
                      ),
                      prefixIcon: const Icon(Iconsax.password_check),
                    ),
                  ),
                ),
                const SizedBox(
                  height: ZSizes.spaceBtwItems,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.reAuthenticateEmailAndPasswordUser(),
                    child: const Text(ZTexts.signIn),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
