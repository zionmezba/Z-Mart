import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:z_mart/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/z_circular_icon.dart';
import '../../../../../common/widgets/images/z_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class ZProductImageSlider extends StatelessWidget {
  const ZProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return ZCurvedEdgeWidget(
      child: Container(
        color: dark ? ZColors.darkerGrey : ZColors.light,
        child: Stack(
          children: [

            ///Main Large Image
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(ZSizes.productImageRadius * 2),
                child: Center(
                    child: Image(
                        image: AssetImage(ZImages.productImage1))),
              ),
            ),

            /// Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: ZSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) =>
                  const SizedBox(
                    width: ZSizes.spaceBtwItems,
                  ),
                  itemBuilder: (_, index) =>
                      ZRoundedImage(
                        imageUrl: ZImages.productImage1,
                        width: 80,
                        backgroundColor: dark ? ZColors.dark : ZColors.white,
                        border: Border.all(color: ZColors.primary),
                        padding: const EdgeInsets.all(ZSizes.sm),
                      ),
                ),
              ),
            ),
            const ZAppBar(
              showBackArrow: true,
              actions: [
                ZCircularIcon(icon: Iconsax.heart5, color: Colors.red,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
