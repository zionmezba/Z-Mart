import 'package:flutter/material.dart';
import 'package:z_mart/common/widgets/layouts/grid_layout.dart';
import 'package:z_mart/common/widgets/loaders/shimmer.dart';

class ZBrandShimmer extends StatelessWidget {
  const ZBrandShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ZGridLayout(
        itemCount: itemCount,
        itemBuilder: (_, __) => const ZShimmerEffect(height: 80, width: 300));
  }
}
