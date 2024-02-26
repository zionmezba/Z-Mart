import 'package:flutter/material.dart';
import 'package:z_mart/common/widgets/appbar/appbar.dart';
import 'package:z_mart/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:z_mart/utils/constants/colors.dart';
import 'package:z_mart/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///-----Header---
            ZPrimaryHeaderContainer(
                child: Column(
              children: [
                ZAppBar(
                  title: Text(
                    'Account',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: ZColors.white),
                  ),
                ),
                const SizedBox(height: ZSizes.spaceBtwSections,)
              ],
            ))

            ///----Body------
          ],
        ),
      ),
    );
  }
}
