import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:z_mart/common/widgets/appbar/appbar.dart';
import 'package:z_mart/common/widgets/images/z_circular_image.dart';
import 'package:z_mart/common/widgets/loaders/shimmer.dart';
import 'package:z_mart/common/widgets/texts/section_heading.dart';
import 'package:z_mart/features/personalization/controllers/user_controller.dart';
import 'package:z_mart/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:z_mart/utils/constants/image_strings.dart';
import 'package:z_mart/utils/constants/sizes.dart';

import 'widgets/change_name.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
      appBar: const ZAppBar(
        showBackArrow: true,
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Column(
            children: [
              Column(
                children: [
                  ///Profile Picture
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Obx(() {
                          final networkImage =
                              controller.user.value.profilePicture;
                          final image = networkImage.isNotEmpty
                              ? networkImage
                              : ZImages.userImage;
                          return controller.imageUploading.value
                              ? const ZShimmerEffect(
                                  height: 80, width: 80, radius: 80)
                              : ZCircularImage(
                                  image: image,
                                  height: 80,
                                  width: 80,
                                  isNetworkImage: networkImage.isNotEmpty,
                                );
                        }),
                        TextButton(
                          onPressed: () =>
                              controller.uploadUserProfilePicture(),
                          child: const Text('Change Profile Picture'),
                        ),
                      ],
                    ),
                  ),

                  ///------Details-----
                  const SizedBox(
                    height: ZSizes.spaceBtwItems / 2,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: ZSizes.spaceBtwItems,
                  ),
                  const ZSectionHeading(
                    title: 'Profile Information',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: ZSizes.spaceBtwItems,
                  ),
                  ZProfileMenu(
                    title: 'Name',
                    value: controller.user.value.fullName,
                    onPressed: () => Get.to(() => const ChangeName()),
                  ),
                  ZProfileMenu(
                    title: 'Username',
                    value: controller.user.value.username,
                    onPressed: () {},
                  ),

                  const SizedBox(
                    height: ZSizes.spaceBtwItems,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: ZSizes.spaceBtwItems,
                  ),

                  ZProfileMenu(
                    title: 'User ID',
                    value: controller.user.value.id,
                    onPressed: () {},
                    icon: Iconsax.copy,
                  ),
                  ZProfileMenu(
                    title: 'E-mail',
                    value: controller.user.value.email,
                    onPressed: () {},
                  ),
                  ZProfileMenu(
                    title: 'Phone Number',
                    value: controller.user.value.phoneNumber,
                    onPressed: () {},
                  ),
                  ZProfileMenu(
                    title: 'Gender',
                    value: 'Male',
                    onPressed: () {},
                  ),
                  ZProfileMenu(
                    title: 'Date of Birth',
                    value: '23 Feb 1999',
                    onPressed: () {},
                  ),
                  const Divider(),
                  const SizedBox(
                    height: ZSizes.spaceBtwItems,
                  ),

                  Center(
                    child: TextButton(
                      onPressed: () => controller.deleteAccountWarningPopup(),
                      child: const Text(
                        'Delete Account',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
