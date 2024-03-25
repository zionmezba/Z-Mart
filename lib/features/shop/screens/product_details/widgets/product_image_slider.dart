import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:z_mart/features/shop/controllers/product/images_controller.dart';
import 'package:z_mart/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/z_circular_icon.dart';
import '../../../../../common/widgets/images/z_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../models/product_model.dart';

class ZProductImageSlider extends StatelessWidget {
  const ZProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);

    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);

    return ZCurvedEdgeWidget(
      child: Container(
        color: dark ? ZColors.darkerGrey : ZColors.light,
        child: Stack(
          children: [
            ///Main Large Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(ZSizes.productImageRadius * 2),
                child: Center(
                  child: Obx(() {
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: () => controller.showEnlargedImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress,
                                color: ZColors.primary),
                      ),
                    );
                  }),
                ),
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
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(
                    width: ZSizes.spaceBtwItems,
                  ),
                  itemBuilder: (_, index) => Obx(() {
                    final imageSelected =
                        controller.selectedProductImage.value == images[index];
                    return ZRoundedImage(
                      isNetworkImage: true,
                      imageUrl: images[index],
                      width: 80,
                      backgroundColor: dark ? ZColors.dark : ZColors.white,
                      border: Border.all(
                          color: imageSelected
                              ? ZColors.primary
                              : Colors.transparent),
                      padding: const EdgeInsets.all(ZSizes.sm),
                      onPressed: () =>
                          controller.selectedProductImage.value = images[index],
                    );
                  }),
                ),
              ),
            ),
            const ZAppBar(
              showBackArrow: true,
              actions: [
                ZCircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
