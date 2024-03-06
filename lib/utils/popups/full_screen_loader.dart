import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:z_mart/utils/constants/colors.dart';
import 'package:z_mart/utils/helpers/helper_functions.dart';

import '../../common/widgets/loaders/animation_loader.dart';

class ZFullScreenLoader {
  static void openLoadingDialogue(String text, String animation) {
    final dark = ZHelperFunctions.isDarkMode(Get.context!);
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: dark ? ZColors.dark : ZColors.white,
          child: Column(
            children: [
              const SizedBox(height: 250),
              ZAnimationLoaderWidget(text: text, animation: animation)
            ],
          ),
        ),
      ),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
