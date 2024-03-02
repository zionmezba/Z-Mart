import 'package:flutter/material.dart';
import 'package:z_mart/utils/constants/text_strings.dart';

import '../../../../../utils/constants/sizes.dart ';

class ZBillingAmountSection extends StatelessWidget {
  const ZBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///Subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            Text('${ZTexts.currencyBDT}980',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: ZSizes.spaceBtwItems),

        ///Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('${ZTexts.currencyBDT}60',
                style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: ZSizes.spaceBtwItems),

        ///Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('${ZTexts.currencyBDT}50',
                style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: ZSizes.spaceBtwItems),

        ///Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium),
            Text('${ZTexts.currencyBDT}50',
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: ZSizes.spaceBtwItems),

      ],
    );
  }
}
