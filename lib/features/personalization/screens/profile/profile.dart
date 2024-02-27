import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:z_mart/common/widgets/appbar/appbar.dart';
import 'package:z_mart/common/widgets/images/z_circular_image.dart';
import 'package:z_mart/common/widgets/texts/section_heading.dart';
import 'package:z_mart/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:z_mart/utils/constants/image_strings.dart';
import 'package:z_mart/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                        const ZCircularImage(
                          image: ZImages.userImage,
                          height: 80,
                          width: 80,
                        ),
                        TextButton(
                          onPressed: () {},
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
                    value: 'Zion Mezba',
                    onPressed: () {},
                  ),
                  ZProfileMenu(
                    title: 'Username',
                    value: 'zion_mezba',
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
                    value: '721500444',
                    onPressed: () {},
                    icon: Iconsax.copy,
                  ),
                  ZProfileMenu(
                    title: 'E-mail',
                    value: 'mezbazion@gmil.com',
                    onPressed: () {},
                  ),
                  ZProfileMenu(
                    title: 'Phone Number',
                    value: '01750458479',
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
                      onPressed: () {},
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
