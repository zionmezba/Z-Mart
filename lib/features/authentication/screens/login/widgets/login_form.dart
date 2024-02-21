import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class ZLoginForm extends StatelessWidget {
  const ZLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: ZSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: ZTexts.email),
            ),
            const SizedBox(
              height: ZSizes.spaceBetweenInputFields,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check),
                  labelText: ZTexts.password,
                  suffixIcon: Icon(Iconsax.eye_slash)),
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
                    onPressed: () {}, child: const Text(ZTexts.forgetPassword)),
              ],
            ),
            const SizedBox(
              height: ZSizes.spaceBtwSections,
            ),

            // Sign in Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
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
                onPressed: () {},
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
