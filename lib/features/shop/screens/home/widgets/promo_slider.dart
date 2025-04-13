import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:z_mart/common/widgets/loaders/shimmer.dart';
import 'package:z_mart/features/shop/controllers/banner_controller.dart';
import 'package:z_mart/utils/constants/colors.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/z_rounded_image.dart';
import '../../../../../utils/constants/sizes.dart';

class ZPromoSlider extends StatelessWidget {
  const ZPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());

    return Obx(() {
      //show loader
      if (controller.isLoading.value) {
        return const ZShimmerEffect(height: 190, width: double.infinity);
      }
      //If No Data Found
      if (controller.allBanners.isEmpty) {
        return const Center(child: Text('No Data Found!'));
      } else {
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  viewportFraction: 1,
                  onPageChanged: (index, _) =>
                      controller.updatePageIndicator(index)),
              items: controller.allBanners
                  .map(
                    (banner) => ZRoundedImage(
                        imageUrl: banner.imageUrl,
                        isNetworkImage: true,
                        onPressed: () => Get.toNamed(banner.targetScreen)),
                  )
                  .toList(),
            ),
            const SizedBox(
              height: ZSizes.spaceBtwItems,
            ),
            Center(
              child: Obx(
                () => Row(mainAxisSize: MainAxisSize.min, children: [
                  for (int i = 0; i < controller.allBanners.length; i++)
                    ZCircularContainer(
                        width: 20,
                        height: 4,
                        margin: const EdgeInsets.only(right: 10),
                        backgroundColor:
                            controller.carousalCurrentIndex.value == i
                                ? ZColors.primary
                                : ZColors.grey)
                ]),
              ),
            )
          ],
        );
      }
    });
  }
}
