import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:z_mart/features/personalization/controllers/user_controller.dart';
import 'package:z_mart/features/shop/screens/cart/cart.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/loaders/shimmer.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class ZHomeAppbar extends StatelessWidget {
  const ZHomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return ZAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ZTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: ZColors.grey),
          ),
          Obx(() {
            if (controller.profileLoading.value) {
              return const ZShimmerEffect(width: 80, height: 15);
            } else {
              return Text(
                controller.user.value.fullName,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: ZColors.white),
              );
            }
          }),
        ],
      ),
      actions: [
        ZCartCounterIcon(
          onPressed: () => Get.to(() => const CartScreen()),
          iconColor: ZColors.white,
        ),
      ],
    );
  }
}
