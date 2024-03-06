import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:z_mart/common/widgets/loaders/loaders.dart';
import 'package:z_mart/data/repositories/authentication/authentication_repository.dart';
import 'package:z_mart/data/repositories/user/user_repository.dart';
import 'package:z_mart/features/authentication/screens/signup/verify_email.dart';
import 'package:z_mart/features/personalization/models/user_model.dart';
import 'package:z_mart/utils/constants/image_strings.dart';

import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  ///Variables
  final hidePassword = true.obs;
  final privacyPolicy = false.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final firstName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  final username = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  ///Signup
  void signup() async {
    try {
      //Start Loading
      ZFullScreenLoader.openLoadingDialogue(
          'We are processing your information', ZImages.docerAnimation);

      //Check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        ZFullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if (!signupFormKey.currentState!.validate()) {
        ZFullScreenLoader.stopLoading();
        return;
      }

      //Privacy policy check
      if (!privacyPolicy.value) {
        ZLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            duration: 2,
            message:
                'In order to create an account you have to accept the privacy and policy terms of use');
        ZFullScreenLoader.stopLoading();
        return;
      }

      //Register user in firebase auth and save user data
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //save authed user data in firebase
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      //Show success message
      ZLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created successfully');

      //move to verify email screen
      Get.to(() => const VerifyEmailScreen());
    } catch (e) {
      //remove loader
      ZFullScreenLoader.stopLoading();
      ZLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
