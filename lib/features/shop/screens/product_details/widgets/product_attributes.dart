import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:z_mart/common/styles/rounded_container.dart';
import 'package:z_mart/common/widgets/products/product_price.dart';
import 'package:z_mart/common/widgets/texts/section_heading.dart';
import 'package:z_mart/features/shop/controllers/product/variation_controller.dart';
import 'package:z_mart/features/shop/models/product_model.dart';
import 'package:z_mart/features/shop/screens/product_details/widgets/product_title_text.dart';
import 'package:z_mart/utils/constants/colors.dart';
import 'package:z_mart/utils/constants/sizes.dart%20';
import 'package:z_mart/utils/constants/text_strings.dart';
import 'package:z_mart/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';

class ZProductAttributes extends StatelessWidget {
  const ZProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    final controller = Get.put(VariationController());

    return Obx(
      () => Column(
        children: [
          /// Selected Attribute pricing
          /// display variation price and stock when some variation is selected
          if (controller.selectedVariation.value.id.isNotEmpty)
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
                      const SizedBox(width: ZSizes.spaceBtwItems),
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
                              if (controller.selectedVariation.value.salePrice >
                                  0)
                                Text(
                                  '${ZTexts.currencyBDT}${controller.selectedVariation.value.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .apply(
                                          decoration:
                                              TextDecoration.lineThrough),
                                ),
                              const SizedBox(width: ZSizes.spaceBtwItems),

                              ///Sale Price
                              ZProductPriceText(
                                  price: controller.getVariationPrice())
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
                                controller.variationStockStatus.value,
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  ZProductTitleText(
                    title: controller.selectedVariation.value.description ?? '',
                    smallSize: true,
                    maxLines: 4,
                  )
                ],
              ),
            ),
          const SizedBox(height: ZSizes.spaceBtwItems),

          ///--Attributes
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map((attribute) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ZSectionHeading(
                          title: attribute.name ?? '',
                          showActionButton: false,
                        ),
                        const SizedBox(height: ZSizes.spaceBtwItems / 2),
                        Obx(
                          () => Wrap(
                              spacing: 8,
                              children: attribute.values!.map((attributeValue) {
                                final isSelected = controller
                                        .selectedAttributes[attribute.name] ==
                                    attributeValue;
                                final available = controller
                                    .getAttributesAvailabilityInVariation(
                                        product.productVariations!,
                                        attribute.name!)
                                    .contains(attributeValue);

                                return ZChoiceChip(
                                  text: attributeValue,
                                  selected: isSelected,
                                  onSelected: available
                                      ? (selected) {
                                          if (selected && available) {
                                            controller.onAttributeSelected(
                                                product,
                                                attribute.name ?? '',
                                                attributeValue);
                                          }
                                        }
                                      : null,
                                );
                              }).toList()),
                        )
                      ],
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
