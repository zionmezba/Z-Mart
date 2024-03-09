import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:z_mart/features/personalization/controllers/user_controller.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/z_circular_image.dart';

class ZUserProfileTile extends StatelessWidget {
  const ZUserProfileTile({
    super.key,
    this.onPressed,
  });

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return ListTile(
      leading: const ZCircularImage(
        image: ZImages.userImage,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        controller.user.value.fullName,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: ZColors.white),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Iconsax.edit,
          color: ZColors.white,
        ),
      ),
      subtitle: Text(controller.user.value.email,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: ZColors.white)),
    );
  }
}
