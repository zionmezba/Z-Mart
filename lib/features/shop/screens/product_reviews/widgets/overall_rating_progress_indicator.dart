import 'package:flutter/material.dart';
import 'package:z_mart/features/shop/screens/product_reviews/widgets/progress_indicator_rating.dart';

class ZOverallProductRating extends StatelessWidget {
  const ZOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            '4.8',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              ZRatingProgressIndicator(
                text: '5',
                value: 1.0,
              ),
              ZRatingProgressIndicator(
                text: '4',
                value: 0.8,
              ),
              ZRatingProgressIndicator(
                text: '3',
                value: 0.6,
              ),
              ZRatingProgressIndicator(
                text: '2',
                value: 0.4,
              ),
              ZRatingProgressIndicator(
                text: '1',
                value: 0.2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
