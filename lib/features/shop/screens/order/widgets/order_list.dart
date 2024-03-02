import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:z_mart/common/styles/rounded_container.dart';
import 'package:z_mart/utils/constants/colors.dart';
import 'package:z_mart/utils/constants/sizes.dart%20';
import 'package:z_mart/utils/helpers/helper_functions.dart';

class ZOrderListItems extends StatelessWidget {
  const ZOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return ListView.separated(
      separatorBuilder: (_, __)=> const SizedBox(height: ZSizes.spaceBtwItems),
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder:(_, index) => ZRoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(ZSizes.md),
        backgroundColor: dark ? ZColors.dark : ZColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ///---- Row - 1
            Row(
              children: [
                ///1 - Icon
                const Icon(Iconsax.ship),
                const SizedBox(width: ZSizes.spaceBtwItems / 2),
      
                ///2 - Status and Date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: ZColors.primary, fontWeightDelta: 1),
                      ),
                      Text('07 Mar 2024',
                          style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),
      
                ///3 - Icon
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.arrow_right_34,
                    size: ZSizes.iconSm,
                  ),
                ),
      
                const SizedBox(width: ZSizes.spaceBtwItems / 2),
              ],
            ),
            const SizedBox(height: ZSizes.spaceBtwItems),
      
            ///---- Row - 2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      ///1 - Icon
                      const Icon(Iconsax.tag),
                      const SizedBox(width: ZSizes.spaceBtwItems / 2),
      
                      ///2 - Status and Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order',
                                style: Theme.of(context).textTheme.labelMedium),
                            Text('[#0176F2]',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
      
                      const SizedBox(width: ZSizes.spaceBtwItems / 2),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      ///1 - Icon
                      const Icon(Iconsax.calendar),
                      const SizedBox(width: ZSizes.spaceBtwItems / 2),
      
                      ///2 - Status and Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Shipping Date',
                                style: Theme.of(context).textTheme.labelMedium),
                            Text('14 Mar 2024',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
      
                      const SizedBox(width: ZSizes.spaceBtwItems / 2),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
