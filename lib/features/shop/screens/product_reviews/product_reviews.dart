import 'package:flutter/material.dart';
import 'package:z_mart/common/widgets/appbar/appbar.dart';
import 'package:z_mart/features/shop/screens/product_reviews/widgets/overall_rating_progress_indicator.dart';
import 'package:z_mart/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:z_mart/utils/constants/sizes.dart%20';

import '../../../../common/widgets/products/rating/rating_indicator.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ZAppBar(
        title: Text('Ratings & Reviews'),
        showBackArrow: true,
      ),

      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Ratings and reviews are verified and are from people who use the same."),
              const SizedBox(height: ZSizes.spaceBtwItems),

              //Overall product rating
              const ZOverallProductRating(),
              const ZRatingBarIndicator(rating: 4.5,),
              Text("1,016",style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: ZSizes.spaceBtwSections),


              ///User Review list
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
