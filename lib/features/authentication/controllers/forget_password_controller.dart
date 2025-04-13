import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:z_mart/data/repositories/authentication/authentication_repository.dart';
import 'package:z_mart/features/authentication/screens/password_config/reset_password.dart';
import 'package:z_mart/utils/constants/image_strings.dart';
import 'package:z_mart/utils/popups/full_screen_loader.dart';

import '../../../common/widgets/loaders/loaders.dart';
import '../../../utils/helpers/network_manager.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      ZFullScreenLoader.openLoadingDialogue(
          'Processing your request...', ZImages.docerAnimation);

      //Check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        ZFullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        ZFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      //remove loader
      ZFullScreenLoader.stopLoading();

      //Show success message
      ZLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Password reset link sent to your email.');

      //move to reset screen
      Get.to(() => ResetPasswordScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      //remove loader
      ZFullScreenLoader.stopLoading();
      ZLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      ZFullScreenLoader.openLoadingDialogue(
          'Processing your request...', ZImages.docerAnimation);

      //Check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        ZFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      //remove loader
      ZFullScreenLoader.stopLoading();

      //Show success message
      ZLoaders.successSnackBar(
          title: 'Email Sent Again!',
          message: 'Password reset link sent to your email.');
    } catch (e) {
      //remove loader
      ZFullScreenLoader.stopLoading();
      ZLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
