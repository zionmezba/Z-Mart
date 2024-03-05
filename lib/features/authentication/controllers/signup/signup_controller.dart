import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:z_mart/utils/constants/image_strings.dart';

import '../../../../utils/popups/full_screen_loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  ///Variables
  final email = TextEditingController();
  final lastName = TextEditingController();
  final firstName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  final username = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  ///Signup
  Future<void> signup() async {
    try {
      //Start Loading
      ZFullScreenLoader.openLoadingDialogue('We are processing your information', ZImages.successCheckoutImage);
    }
    catch () {}
  }
}
