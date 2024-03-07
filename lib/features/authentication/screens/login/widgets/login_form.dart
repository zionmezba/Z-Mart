import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:z_mart/features/authentication/screens/password_config/forgot_password.dart';
import 'package:z_mart/features/authentication/screens/signup/signup.dart';
import 'package:z_mart/utils/helpers/helper_functions.dart';
import 'package:z_mart/utils/validators/validator.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../controllers/login/login_controller.dart';

class ZLoginForm extends StatelessWidget {
  const ZLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: ZSizes.spaceBtwSections),
        child: Column(
          children: [
            ///Email
            TextFormField(
              controller: controller.email,
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
                controller: controller.password,
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
              height: ZSizes.spaceBetweenInputFields / 2,
            ),

            ///Remember me
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value =
                              !controller.rememberMe.value),
                    ),
                    const Text(ZTexts.rememberMe),
                  ],
                ),

                // Forgot Pass
                TextButton(
                    onPressed: () => Get.to(() => const ForgotPassword()),
                    child: const Text(ZTexts.forgetPassword)),
              ],
            ),
            const SizedBox(
              height: ZSizes.spaceBtwSections,
            ),

            // Sign in Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordSignIn(),
                child: const Text(ZTexts.signIn),
              ),
            ),

            const SizedBox(
              height: ZSizes.spaceBtwItems,
            ),

            // Sign Up Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(ZTexts.createAccount),
              ),
            ),
            const SizedBox(
              height: ZSizes.spaceBtwSections,
            )
          ],
        ),
      ),
    );
  }
}
