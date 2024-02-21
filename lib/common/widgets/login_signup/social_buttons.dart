import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';

class ZSocialButtons extends StatelessWidget {
  const ZSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: ZColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              image: AssetImage(
                ZImages.google,
              ),
              width: ZSizes.iconMd,
              height: ZSizes.iconMd,
            ),
          ),
        ),
        const SizedBox(
          width: ZSizes.spaceBtwItems,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: ZColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              image: AssetImage(
                ZImages.facebook,
              ),
              width: ZSizes.iconMd,
              height: ZSizes.iconMd,
            ),
          ),
        ),
      ],
    );
  }
}
