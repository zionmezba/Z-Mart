import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:z_mart/data/repositories/user/user_repository.dart';
import 'package:z_mart/features/personalization/controllers/user_controller.dart';
import 'package:z_mart/features/personalization/screens/profile/profile.dart';

import '../../../common/widgets/loaders/loaders.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  GlobalKey<FormState> updateUsernameFormKey = GlobalKey<FormState>();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
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
      if (!updateUsernameFormKey.currentState!.validate()) {
        ZFullScreenLoader.stopLoading();
        return;
      }

      ///Update user first and last name
      Map<String, dynamic> name = {
        'firstName': firstName.text.trim(),
        'lastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      //Update RX user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      ///Stop loading
      ZFullScreenLoader.stopLoading();

      //Show success message
      ZLoaders.successSnackBar(
          title: 'Done', message: 'Your information updated successfully');

      //move to verify email screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      //remove loader
      ZFullScreenLoader.stopLoading();
      ZLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
