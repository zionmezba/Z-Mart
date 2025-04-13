import 'package:flutter/material.dart';
import 'package:z_mart/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart ';
import '../../../styles/rounded_container.dart';

class ZCouponCode extends StatelessWidget {
  const ZCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return ZRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? ZColors.dark : ZColors.white,
      padding: const EdgeInsets.only(
          top: ZSizes.sm, bottom: ZSizes.sm, right: ZSizes.sm, left: ZSizes.md),
      child: Row(
        children: [
          //Coupon Text field
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Have a coupon? Enter here',
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none),
            ),
          ),

          ///Button
          SizedBox(
              width: 80,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: dark
                          ? ZColors.white.withOpacity(0.5)
                          : ZColors.dark.withOpacity(0.5),
                      backgroundColor: ZColors.grey.withOpacity(0.2),
                      side: BorderSide(color: ZColors.grey.withOpacity(0.1))),
                  onPressed: () {},
                  child: const Text('Apply')))
        ],
      ),
    );
  }
}
