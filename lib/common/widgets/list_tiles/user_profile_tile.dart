import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/z_circular_image.dart';

class ZUserProfileTile extends StatelessWidget {
  const ZUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const ZCircularImage(
        image: ZImages.userImage,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        'Zion Mezba',
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: ZColors.white),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(
          Iconsax.edit,
          color: ZColors.white,
        ),
      ),
      subtitle: Text('mezbazion@gmail.com',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: ZColors.white)),
    );
  }
}
