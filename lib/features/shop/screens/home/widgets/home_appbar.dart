import 'package:flutter/material.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class ZHomeAppbar extends StatelessWidget {
  const ZHomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          Text(
            ZTexts.homeAppbarSubTitle,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: ZColors.light),
          ),
        ],
      ),
      actions: [
        ZCartCounterIcon(
          onPressed: () {},
          iconColor: ZColors.light,
        ),
      ],
    );
  }
}
