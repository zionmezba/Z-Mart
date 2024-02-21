import 'package:flutter/material.dart';
import 'package:z_mart/common/styles/spacing_style.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});
  final String image, title, subTitle;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: ZSpacingStyle.paddingWithAppbarHeight*2,
          child: Column(
            children: [
              Image(
                image: AssetImage(image),
                width: ZHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(
                height: ZSizes.spaceBtwSections,
              ),

              // Title
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: ZSizes.spaceBtwItems,
              ),
              Text(
                subTitle,
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
                  onPressed: onPressed,
                  child: const Text(ZTexts.zContinue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
