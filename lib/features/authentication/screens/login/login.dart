import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:z_mart/common/styles/spacing_style.dart';
import 'package:z_mart/features/authentication/screens/login/widgets/login_form.dart';
import 'package:z_mart/features/authentication/screens/login/widgets/login_header.dart';
import 'package:z_mart/utils/constants/sizes.dart';
import 'package:z_mart/utils/constants/text_strings.dart';
import 'package:z_mart/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: ZSpacingStyle.paddingWithAppbarHeight,
          child: Column(
            children: [
              ZLoginHeader(dark: dark),
              const SizedBox(
                height: ZSizes.spaceBtwSections,
              ),

              // Form
              const ZLoginForm(),

              // Divider
              ZFormDivider(dividerText: ZTexts.orSignInWith.capitalize!),
              const SizedBox(
                height: ZSizes.spaceBtwSections,
              ),
              // Footer
              const ZSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
