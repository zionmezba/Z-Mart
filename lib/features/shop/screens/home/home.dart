import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:z_mart/common/widgets/appbar/appbar.dart';
import 'package:z_mart/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:z_mart/utils/constants/colors.dart';
import 'package:z_mart/utils/constants/text_strings.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/products/cart/cart_menu_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ZPrimaryHeaderContainer(
              child: Column(
                children: [ZHomeAppbar()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
