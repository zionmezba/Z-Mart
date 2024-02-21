import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ZTermCond extends StatelessWidget {
  const ZTermCond({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          child: Checkbox(value: true, onChanged: (value) {}),
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
