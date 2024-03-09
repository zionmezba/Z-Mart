import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:z_mart/common/widgets/loaders/loaders.dart';
import 'package:z_mart/data/repositories/authentication/authentication_repository.dart';
import 'package:z_mart/data/repositories/user/user_repository.dart';
import 'package:z_mart/features/authentication/screens/login/login.dart';
import 'package:z_mart/features/personalization/models/user_model.dart';
import 'package:z_mart/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:z_mart/utils/constants/image_strings.dart';
import 'package:z_mart/utils/constants/sizes.dart%20';
import 'package:z_mart/utils/popups/full_screen_loader.dart';

import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../../utils/helpers/network_manager.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());
  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  ///Functions to fetch user data
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      ZLoaders.warningSnackBar(
          title: 'Unable to fetch',
          message: 'Something went wrong while saving your data');
    } finally {
      profileLoading.value = false;
    }
  }

  ///Functions to save user data
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        final nameParts =
            UserModel.nameParts(userCredential.user!.displayName ?? '');
        final username =
            UserModel.generateUsername(userCredential.user!.displayName ?? '');

        //Map data
        final user = UserModel(
          id: userCredential.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          username: username,
          email: userCredential.user!.email ?? '',
          phoneNumber: userCredential.user!.phoneNumber ?? '',
          profilePicture: userCredential.user!.photoURL ?? '',
        );

        //save data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      ZLoaders.warningSnackBar(
          title: 'Data not saved',
          message: 'Something went wrong while saving your data');
    }
  }

  ///Delete Account warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(ZSizes.md),
      title: 'Delete Account',
      middleText:
          'Are you sure want to delete your account? Your data will be removed permanently!',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            side: const BorderSide(color: Colors.red)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: ZSizes.lg),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text('Cancel'),
      ),
    );
  }

  ///Delete user account
  void deleteUserAccount() async {
    try {
      ZFullScreenLoader.openLoadingDialogue(
          'Processing', ZImages.docerAnimation);
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;

      if (provider == 'google.com') {
        await auth.signInWithGoogle();
        await auth.deleteAccount();
        ZFullScreenLoader.stopLoading();
        Get.offAll(() => const LoginScreen());
      } else if (provider == 'password') {
        ZFullScreenLoader.stopLoading();
        Get.to(() => const ReAuthLoginForm());
      }
    } catch (e) {
      ZFullScreenLoader.stopLoading();
      ZLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Re Authenticate user before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      ZFullScreenLoader.openLoadingDialogue(
          'Processing', ZImages.docerAnimation);

      //Check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        ZFullScreenLoader.stopLoading();
        return;
      }
      //Form Validation
      if (!reAuthFormKey.currentState!.validate()) {
        ZFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.reAuthWithEmailAndPassword(
          verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      ZFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw ZFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw ZFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const ZFormatException();
    } on PlatformException catch (e) {
      throw ZPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
