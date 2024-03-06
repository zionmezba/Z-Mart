import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/signup/signup_controller.dart';

class ZTermCond extends StatelessWidget {
  const ZTermCond({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = ZHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          child: Obx(() => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) => controller.privacyPolicy.value =
                  !controller.privacyPolicy.value)),
        ),
        const SizedBox(
          width: ZSizes.spaceBtwItems,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: '${ZTexts.iAgreeTo} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: '${ZTexts.privacyPolicy} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? ZColors.textWhite : ZColors.primary,
                    decorationColor:
                        dark ? ZColors.textWhite : ZColors.primary),
              ),
              TextSpan(
                  text: '${ZTexts.and} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: ZTexts.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? ZColors.textWhite : ZColors.primary,
                    decorationColor:
                        dark ? ZColors.textWhite : ZColors.primary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
