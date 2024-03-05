import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:z_mart/features/authentication/controllers/signup/signup_controller.dart';
import 'package:z_mart/features/authentication/screens/signup/widgets/term_cond.dart';
import 'package:z_mart/utils/helpers/helper_functions.dart';
import 'package:z_mart/utils/validators/validator.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class ZSignupForm extends StatelessWidget {
  const ZSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    final dark = ZHelperFunctions.isDarkMode(context);
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => ZValidator.validateEmptyText('First Name', value),
                  expands: false,
                  decoration: InputDecoration(
                      floatingLabelStyle:
                          TextStyle(color: dark ? Colors.white : Colors.black),
                      labelText: ZTexts.firstName,
                      prefixIcon: const Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: ZSizes.spaceBetweenInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) => ZValidator.validateEmptyText('Last Name', value),
                  expands: false,
                  decoration: InputDecoration(
                      floatingLabelStyle:
                          TextStyle(color: dark ? Colors.white : Colors.black),
                      labelText: ZTexts.lastName,
                      prefixIcon: const Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: ZSizes.spaceBetweenInputFields,
          ),
          TextFormField(
            controller: controller.username,
            validator: (value) => ZValidator.validateEmptyText('User Name', value),
            expands: false,
            decoration: InputDecoration(
                floatingLabelStyle:
                    TextStyle(color: dark ? Colors.white : Colors.black),
                labelText: ZTexts.username,
                prefixIcon: const Icon(Iconsax.user_edit)),
          ),
          const SizedBox(
            height: ZSizes.spaceBetweenInputFields,
          ),
          TextFormField(
            controller: controller.email,
            validator: (value) => ZValidator.validateEmail(value),
            decoration: InputDecoration(
                floatingLabelStyle:
                    TextStyle(color: dark ? Colors.white : Colors.black),
                labelText: ZTexts.email,
                prefixIcon: const Icon(Iconsax.direct)),
          ),
          const SizedBox(
            height: ZSizes.spaceBetweenInputFields,
          ),
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => ZValidator.validatePhoneNumber(value),
            decoration: InputDecoration(
                floatingLabelStyle:
                    TextStyle(color: dark ? Colors.white : Colors.black),
                labelText: ZTexts.phoneNo,
                prefixIcon: const Icon(Iconsax.call)),
          ),
          const SizedBox(
            height: ZSizes.spaceBetweenInputFields,
          ),
          TextFormField(
            controller: controller.password,
            validator: (value) => ZValidator.validatePassword(value),
            obscureText: true,
            decoration: InputDecoration(
              floatingLabelStyle:
                  TextStyle(color: dark ? Colors.white : Colors.black),
              labelText: ZTexts.password,
              suffixIcon: const Icon(Iconsax.eye_slash),
              prefixIcon: const Icon(Iconsax.password_check),
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
              onPressed: () => controller.signup(),
              child: const Text(ZTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
