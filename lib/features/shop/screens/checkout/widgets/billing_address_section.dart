import 'package:flutter/material.dart';
import 'package:z_mart/utils/constants/sizes.dart%20';

import '../../../../../common/widgets/texts/section_heading.dart';

class ZBillingAddressSection extends StatelessWidget {
  const ZBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ZSectionHeading(
            title: 'Shipping Address', buttonTitle: 'Change', onPressed: () {}),
        Text('Zion Mezba', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: ZSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: ZSizes.spaceBtwItems),
            Text('+880 1750-45879',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: ZSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(width: ZSizes.spaceBtwItems),
            Text(
              'Mirpur 1 Majar Road, Dhaka, Bangladesh',
              style: Theme.of(context).textTheme.bodyMedium,
              softWrap: true,
            ),
          ],
        ),
        const SizedBox(height: ZSizes.spaceBtwItems / 2),
      ],
    );
  }
}
