import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:z_mart/common/styles/rounded_container.dart';
import 'package:z_mart/common/widgets/products/rating/rating_indicator.dart';
import 'package:z_mart/utils/constants/colors.dart';
import 'package:z_mart/utils/constants/image_strings.dart';
import 'package:z_mart/utils/constants/sizes.dart%20';
import 'package:z_mart/utils/helpers/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                    backgroundImage: AssetImage(ZImages.userImage)),
                const SizedBox(width: ZSizes.spaceBtwItems),
                Text('Zion Mezba',
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(width: ZSizes.spaceBtwItems),
        // Reviews
        const Row(
          children: [
            ZRatingBarIndicator(rating: 4),
            SizedBox(width: ZSizes.spaceBtwItems),
            Text('1 Mar 2024')
          ],
        ),
        const SizedBox(height: ZSizes.spaceBtwItems),
        const ReadMoreText(
          'The product is very good. I was able to use the product very comfortably. I wanna thank the seller for this. Suggested for everyone. Get this product and you will find this good.',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: ' show less',
          trimCollapsedText: ' show more',
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: ZColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: ZColors.primary),
        ),
        const SizedBox(height: ZSizes.spaceBtwItems),

        //Company Review
        ZRoundedContainer(
          backgroundColor: dark ? ZColors.darkerGrey : ZColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(ZSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Nike',
                        style: Theme.of(context).textTheme.titleMedium),
                    Text('01 Mar 2024',
                        style: Theme.of(context).textTheme.bodyMedium)
                  ],
                ),
                const SizedBox(height: ZSizes.spaceBtwItems),
                const ReadMoreText(
                  'Thank you for your honest review. You are always welcome to shop here.',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' show less',
                  trimCollapsedText: ' show more',
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: ZColors.primary),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: ZColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: ZSizes.spaceBtwSections),
      ],
    );
  }
}
