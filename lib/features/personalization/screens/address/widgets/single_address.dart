import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:z_mart/utils/constants/colors.dart';
import 'package:z_mart/utils/constants/sizes.dart%20';
import 'package:z_mart/utils/helpers/helper_functions.dart';

import '../../../../../common/styles/rounded_container.dart';

class ZSingleAddress extends StatelessWidget {
  const ZSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);

    return ZRoundedContainer(
      padding: EdgeInsets.all(ZSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress
          ? ZColors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? ZColors.darkerGrey
              : ZColors.grey,
      margin: const EdgeInsets.only(bottom: ZSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? dark
                      ? ZColors.light
                      : ZColors.dark
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Zion Mezba',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: ZSizes.sm / 2),
              Text(
                '+880 1750-458479',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: ZSizes.sm / 2),
              Text(
                'Mirpur 1 block a, Majar Road, Dhaka, Bangladesh',
                maxLines: 2,
                softWrap: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}
