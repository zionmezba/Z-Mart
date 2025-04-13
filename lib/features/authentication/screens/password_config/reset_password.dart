import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:z_mart/features/authentication/controllers/forget_password_controller.dart';
import 'package:z_mart/features/authentication/screens/login/login.dart';
import 'package:z_mart/utils/constants/image_strings.dart';
import 'package:z_mart/utils/constants/sizes.dart';
import 'package:z_mart/utils/constants/text_strings.dart';

import '../../../../utils/helpers/helper_functions.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///Headings Image
              Image(
                image: const AssetImage(ZImages.deliverySuccessEmailImage),
                width: ZHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: ZSizes.spaceBtwSections),

              // email
              Text(
                email,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              //title
              const SizedBox(height: ZSizes.spaceBtwItems),Text(
                ZTexts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: ZSizes.spaceBtwItems),
              Text(
                ZTexts.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: ZSizes.spaceBtwSections,
              ),

              // Button - 1
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAll(() => const LoginScreen()),
                  child: const Text(ZTexts.done),
                ),
              ),
              const SizedBox(
                height: ZSizes.spaceBtwItems,
              ),

              // Button - 2
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => ForgotPasswordController.instance
                      .resendPasswordResetEmail(email),
                  child: const Text(ZTexts.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
