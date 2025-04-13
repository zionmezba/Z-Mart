import 'package:flutter/material.dart';
import 'package:z_mart/common/widgets/loaders/shimmer.dart';
import 'package:z_mart/utils/constants/sizes.dart%20';

class ZCategoryShimmer extends StatelessWidget {
  const ZCategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        separatorBuilder: (_, __) =>
            const SizedBox(width: ZSizes.spaceBtwItems),
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ZShimmerEffect(height: 55, width: 55, radius: 55),
              SizedBox(height: ZSizes.spaceBtwItems / 2),
              ZShimmerEffect(height: 8, width: 55),
            ],
          );
        },
      ),
    );
  }
}
