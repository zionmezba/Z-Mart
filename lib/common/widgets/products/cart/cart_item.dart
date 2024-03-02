import 'package:flutter/material.dart';

import '../../../../features/shop/screens/product_details/widgets/product_title_text.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart ';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/z_rounded_image.dart';
import '../../texts/brand_title_text_with_verified_icon.dart';


class ZCartItem extends StatelessWidget {
  const ZCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        ///Image
        ZRoundedImage(
          imageUrl: ZImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(ZSizes.sm),
          backgroundColor:
          dark ? ZColors.darkerGrey : ZColors.light,
        ),
        const SizedBox(width: ZSizes.spaceBtwItems),

        ///Title price and size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ZBrandTitleTextVerifiedIcon(
                  title: 'Nike'),
              const Flexible(
                  child: ZProductTitleText(
                      title: 'Green sports shoe',
                      maxLines: 1)),

              //Attributes
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Color ',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall),
                TextSpan(
                    text: 'Green  ',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge),
                TextSpan(
                    text: 'Size ',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall),
                TextSpan(
                    text: 'UK 38 ',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge),
              ]))
            ],
          ),
        )
      ],
    );
  }
}
