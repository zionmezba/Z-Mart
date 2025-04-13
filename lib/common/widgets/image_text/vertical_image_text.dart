import 'package:flutter/material.dart';
import 'package:z_mart/common/widgets/images/z_circular_image.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class ZVerticalImageText extends StatelessWidget {
  const ZVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = ZColors.white,
    this.backgroundColor,
    this.onTap,
    this.isNetworkImage = true,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: ZSizes.spaceBtwItems),
        child: Column(
          children: [
            ZCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: ZSizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: dark ? ZColors.light : ZColors.dark,
            ),
            const SizedBox(height: ZSizes.spaceBtwItems / 2),
            SizedBox(
              width: 50,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
