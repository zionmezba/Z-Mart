import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../styles/rounded_container.dart';
import 'brand_card.dart';

class ZBrandShowcase extends StatelessWidget {
  const ZBrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return ZRoundedContainer(
      showBorder: true,
      padding: const EdgeInsets.all(ZSizes.md),
      borderColor: ZColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: ZSizes.spaceBtwItems),
      child: Column(
        children: [
          const ZBrandCard(
            showBorder: false,
          ),
          const SizedBox(
            height: ZSizes.spaceBtwItems,
          ),
          Row(
            children: images
                .map((image) => brandTopProductImageWidget(image, context))
                .toList(),
          )
        ],
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  return Expanded(
    child: ZRoundedContainer(
      height: 100,
      padding: const EdgeInsets.all(ZSizes.md),
      backgroundColor: ZHelperFunctions.isDarkMode(context)
          ? ZColors.darkerGrey
          : ZColors.light,
      margin: const EdgeInsets.only(right: ZSizes.sm),
      child: Image(
        fit: BoxFit.contain,
        image: AssetImage(image),
      ),
    ),
  );
}
