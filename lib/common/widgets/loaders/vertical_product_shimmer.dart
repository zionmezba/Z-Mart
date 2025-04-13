import 'package:flutter/material.dart';
import 'package:z_mart/common/widgets/layouts/grid_layout.dart';
import 'package:z_mart/common/widgets/loaders/shimmer.dart';
import 'package:z_mart/utils/constants/sizes.dart%20';

class ZVerticalProductShimmer extends StatelessWidget {
  const ZVerticalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ZGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Image
            ZShimmerEffect(height: 180, width: 180),
            SizedBox(height: ZSizes.spaceBtwItems),

            //Text
            ZShimmerEffect(height: 15, width: 160),
            SizedBox(height: ZSizes.spaceBtwItems / 2),
            ZShimmerEffect(height: 15, width: 110),
          ],
        ),
      ),
    );
  }
}
