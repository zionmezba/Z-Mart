import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:z_mart/features/authentication/screens/signup/verify_email.dart';
import 'package:z_mart/features/authentication/screens/signup/widgets/term_cond.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../signup.dart';

class ZSignupForm extends StatelessWidget {
  const ZSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: ZTexts.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: ZSizes.spaceBetweenInputFields),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: ZTexts.lastName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: ZSizes.spaceBetweenInputFields,
          ),
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: ZTexts.username,
                prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(
            height: ZSizes.spaceBetweenInputFields,
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: ZTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(
            height: ZSizes.spaceBetweenInputFields,
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: ZTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(
            height: ZSizes.spaceBetweenInputFields,
          ),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: ZTexts.password,
              suffixIcon: Icon(Iconsax.eye_slash),
              prefixIcon: Icon(Iconsax.password_check),
            ),
          ),
          const SizedBox(
            height: ZSizes.spaceBtwSections,
          ),
          // Terms and Cond
          const ZTermCond(),
          const SizedBox(
            height: ZSizes.spaceBtwSections,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(() => const VerifyEmailScreen()),
              child: const Text(ZTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
