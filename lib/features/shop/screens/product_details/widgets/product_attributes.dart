import 'package:flutter/material.dart';
import 'package:z_mart/common/styles/rounded_container.dart';
import 'package:z_mart/common/widgets/products/product_price.dart';
import 'package:z_mart/common/widgets/texts/section_heading.dart';
import 'package:z_mart/features/shop/screens/product_details/widgets/product_title_text.dart';
import 'package:z_mart/utils/constants/colors.dart';
import 'package:z_mart/utils/constants/sizes.dart%20';
import 'package:z_mart/utils/constants/text_strings.dart';
import 'package:z_mart/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';

class ZProductAttributes extends StatelessWidget {
  const ZProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// Selected Attribute pricing
        ZRoundedContainer(
          padding: const EdgeInsets.all(ZSizes.md),
          backgroundColor: dark ? ZColors.darkerGrey : ZColors.grey,
          child: Column(
            children: [
              ///Title Price and stock stat
              Row(
                children: [
                  const ZSectionHeading(
                    title: 'Variation',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    width: ZSizes.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const ZProductTitleText(
                            title: 'Price : ',
                            smallSize: true,
                          ),

                          ///Actual Price
                          Text(
                            '${ZTexts.currencyBDT}1200',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
                            width: ZSizes.spaceBtwItems,
                          ),

                          ///Sale Price
                          const ZProductPriceText(price: '980'),
                        ],
                      ),

                      ///Stock
                      Row(
                        children: [
                          const ZProductTitleText(
                            title: 'Stock : ',
                            smallSize: true,
                          ),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const ZProductTitleText(
                title:
                    'This is the description of the product and this can go up to 4 lines',
                smallSize: true,
                maxLines: 4,
              )
            ],
          ),
        ),
        const SizedBox(
          height: ZSizes.spaceBtwItems,
        ),

        ///--Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ZSectionHeading(
              title: 'Colors',
              showActionButton: false,
            ),
            const SizedBox(
              height: ZSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                ZChoiceChip(
                  text: 'Red',
                  selected: true,
                  onSelected: (value) {},
                ),
                ZChoiceChip(
                  text: 'Green',
                  selected: false,
                  onSelected: (value) {},
                ),
                ZChoiceChip(
                  text: 'Blue',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ZSectionHeading(
              title: 'Sizes',
              showActionButton: false,
            ),
            const SizedBox(
              height: ZSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                ZChoiceChip(
                  text: 'EU 34',
                  selected: true,
                  onSelected: (value) {},
                ),
                ZChoiceChip(
                  text: 'EU 36',
                  selected: false,
                  onSelected: (value) {},
                ),
                ZChoiceChip(
                  text: 'EU 38',
                  selected: false,
                  onSelected: (value) {},
                ),
                ZChoiceChip(
                  text: 'EU 40',
                  selected: false,
                  onSelected: (value) {},
                ),
                ZChoiceChip(
                  text: 'EU 42',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
