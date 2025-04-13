import 'package:flutter/material.dart';
import 'package:z_mart/common/styles/rounded_container.dart';
import 'package:z_mart/common/widgets/texts/section_heading.dart';
import 'package:z_mart/utils/constants/colors.dart';
import 'package:z_mart/utils/constants/image_strings.dart';
import 'package:z_mart/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/sizes.dart ';

class ZBillingPaymentSection extends StatelessWidget {
  const ZBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        ZSectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        const SizedBox(height: ZSizes.spaceBtwItems / 2),
        Row(
          children: [
            ZRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? ZColors.light : ZColors.white,
              padding: const EdgeInsets.all(ZSizes.sm),
              child: const Image(
                image: AssetImage(ZImages.google),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: ZSizes.spaceBtwItems / 2),
            Text('G-pay', style: Theme.of(context).textTheme.bodyLarge)
          ],
        )
      ],
    );
  }
}
