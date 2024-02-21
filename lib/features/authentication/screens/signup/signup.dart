import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:z_mart/common/widgets/login_signup/form_divider.dart';
import 'package:z_mart/common/widgets/login_signup/social_buttons.dart';
import 'package:z_mart/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:z_mart/utils/constants/colors.dart';
import 'package:z_mart/utils/constants/text_strings.dart';
import 'package:z_mart/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/sizes.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Title
              Text(
                ZTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: ZSizes.spaceBtwSections),

              // FOrm
              const ZSignupForm(),
              const SizedBox(
                height: ZSizes.spaceBtwItems,
              ),
              const ZFormDivider(dividerText: ZTexts.orSignInWith),
              const SizedBox(
                height: ZSizes.spaceBtwItems,
              ),
              const ZSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
