import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:z_mart/features/authentication/controllers/onboarding/onboading_controller.dart';
import 'package:z_mart/features/authentication/screens/onboarding/widgets/onboarding_dot_nav.dart';
import 'package:z_mart/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:z_mart/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:z_mart/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:z_mart/utils/constants/colors.dart';
import 'package:z_mart/utils/constants/image_strings.dart';
import 'package:z_mart/utils/constants/sizes.dart';
import 'package:z_mart/utils/constants/text_strings.dart';
import 'package:z_mart/utils/device/device_utility.dart';
import 'package:z_mart/utils/helpers/helper_functions.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());


    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: ZImages.onBoardingImage1,
                title: ZTexts.onBoardingTitle1,
                subTitle: ZTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: ZImages.onBoardingImage2,
                title: ZTexts.onBoardingTitle2,
                subTitle: ZTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: ZImages.onBoardingImage3,
                title: ZTexts.onBoardingTitle3,
                subTitle: ZTexts.onBoardingSubTitle3,
              ),
            ],
          ),
          const OnBoardingSkip(),
          const OnBoardingDotNavigation(),
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
