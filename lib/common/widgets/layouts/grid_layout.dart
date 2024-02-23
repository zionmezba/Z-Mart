import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';

class ZGridLayout extends StatelessWidget {
  const ZGridLayout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent = 288.0,
    required this.itemBuilder,
  });

  final int itemCount;
  final double mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: ZSizes.gridViewSpacing,
        crossAxisSpacing: ZSizes.gridViewSpacing,
        mainAxisExtent: mainAxisExtent,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
