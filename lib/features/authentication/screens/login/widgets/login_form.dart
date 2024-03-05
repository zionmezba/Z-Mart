import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:z_mart/features/authentication/screens/password_config/forgot_password.dart';
import 'package:z_mart/features/authentication/screens/signup/signup.dart';
import 'package:z_mart/navigation_manu.dart';
import 'package:z_mart/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class ZLoginForm extends StatelessWidget {
  const ZLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: ZSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  floatingLabelStyle:
                      TextStyle(color: dark ? Colors.white : Colors.black),
                  prefixIcon: const Icon(Iconsax.direct_right),
                  labelText: ZTexts.email),
            ),
            const SizedBox(
              height: ZSizes.spaceBetweenInputFields,
            ),
            TextFormField(
              decoration: InputDecoration(
                  floatingLabelStyle:
                      TextStyle(color: dark ? Colors.white : Colors.black),
                  prefixIcon: const Icon(Iconsax.password_check),
                  labelText: ZTexts.password,
                  suffixIcon: const Icon(Iconsax.eye_slash)),
            ),
            const SizedBox(
              height: ZSizes.spaceBetweenInputFields / 2,
            ),

            ///Remember forget
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
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
                onPressed: () => Get.off(() => const NavigationMenu()),
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
