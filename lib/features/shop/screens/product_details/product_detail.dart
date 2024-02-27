import 'package:flutter/material.dart';
import 'package:z_mart/features/shop/screens/product_details/widgets/product_image_slider.dart';
import 'package:z_mart/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:z_mart/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:z_mart/utils/constants/sizes.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///1. Product Image Slide
            ZProductImageSlider(),

            ///2. Product Properties
            Padding(
              padding: EdgeInsets.only(
                  right: ZSizes.defaultSpace,
                  left: ZSizes.defaultSpace,
                  bottom: ZSizes.defaultSpace),
              child: Column(
                children: [
                  ///--Rating and share
                  ZRatingAndShare(),

                  ///--Price title stock and brand
                  ZProductMetaData(),

                  ///-- Attributes
                  ///-- Checkout Button
                  ///-- description
                  ///-- reviews
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
