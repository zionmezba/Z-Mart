import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:z_mart/common/widgets/appbar/appbar.dart';
import 'package:z_mart/features/personalization/screens/address/widgets/single_address.dart';
import 'package:z_mart/utils/constants/colors.dart';
import 'package:z_mart/utils/constants/sizes.dart%20';

import 'new_address.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(
          Iconsax.add,
          color: ZColors.white,
        ),
      ),
      appBar: const ZAppBar(
        title: Text("My Addresses"),
        showBackArrow: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.all(ZSizes.defaultSpace),
          child: Column(
            children: [
              ZSingleAddress(selectedAddress: true),
              ZSingleAddress(selectedAddress: false),
            ],
          ),
        ),
      ),
    );
  }
}
