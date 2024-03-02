import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:z_mart/features/shop/screens/sub_category/sub_categories.dart';

import '../../../../../common/widgets/image_text/vertical_image_text.dart';
import '../../../../../utils/constants/image_strings.dart';

class ZHomeCategories extends StatelessWidget {
  const ZHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 7,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return ZVerticalImageText(
            image: ZImages.shoeIcon,
            title: 'Shoes',
            onTap: () => Get.to(() => const SubCategoriesScreen()),
          );
        },
      ),
    );
  }
}
