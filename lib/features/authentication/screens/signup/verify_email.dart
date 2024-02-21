import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:z_mart/common/widgets/success_screen/success_screen.dart';
import 'package:z_mart/features/authentication/screens/login/login.dart';
import 'package:z_mart/utils/constants/image_strings.dart';
import 'package:z_mart/utils/constants/sizes.dart';
import 'package:z_mart/utils/constants/text_strings.dart';
import 'package:z_mart/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Column(
            children: [
              // Image
              Image(
                image: const AssetImage(ZImages.verifyEmailImage),
                width: ZHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(
                height: ZSizes.spaceBtwSections,
              ),

              // Title
              Text(
                ZTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: ZSizes.spaceBtwItems,
              ),
              Text(
                'zionmezba@gmail.com',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: ZSizes.spaceBtwItems,
              ),
              Text(
                ZTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: ZSizes.spaceBtwSections,
              ),

              // Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(
                    () => SuccessScreen(
                      image: ZImages.successVerifyEmailImage,
                      title: ZTexts.yourAccountCreatedTitle,
                      subTitle: ZTexts.yourAccountCreatedSubTitle,
                      onPressed: () => Get.to(() => const LoginScreen()),
                    ),
                  ),
                  child: const Text(ZTexts.zContinue),
                ),
              ),
              const SizedBox(
                height: ZSizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(ZTexts.resendEmail),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
