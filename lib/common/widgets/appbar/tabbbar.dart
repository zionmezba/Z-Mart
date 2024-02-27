import 'package:flutter/material.dart';
import 'package:z_mart/utils/constants/colors.dart';
import 'package:z_mart/utils/device/device_utility.dart';
import 'package:z_mart/utils/helpers/helper_functions.dart';

class ZTabBar extends StatelessWidget implements PreferredSizeWidget {
  const ZTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);

    return Material(
      color: dark ? ZColors.black : ZColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: dark ? ZColors.white : ZColors.primary,
        labelColor: dark ? ZColors.white : ZColors.primary,
        unselectedLabelColor: ZColors.darkGrey,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(ZDeviceUtils.getAppBarHeight());
}
