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
        SizedBox(height: ZSizes.spaceBtwItems / 2),
        Row(
          children: [
            Icon(Icons.phone, color: Colors.grey, size: 16),
            SizedBox(width: ZSizes.spaceBtwItems),
            Text('+880 1750-45879',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(height: ZSizes.spaceBtwItems / 2),
        Row(
          children: [
            Icon(Icons.location_history, color: Colors.grey, size: 16),
            SizedBox(width: ZSizes.spaceBtwItems),
            Text(
              'Mirpur 1 Majar Road, Dhaka, Bangladesh',
              style: Theme.of(context).textTheme.bodyMedium,
              softWrap: true,
            ),
          ],
        ),
        SizedBox(height: ZSizes.spaceBtwItems / 2),
      ],
    );
  }
}
