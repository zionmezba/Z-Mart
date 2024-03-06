import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:z_mart/features/authentication/screens/login/login.dart';
import 'package:z_mart/features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  ///Called from main.dart on launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    //Local Storage
    deviceStorage.writeIfNull('isFirstTime', true);
    deviceStorage.read('isFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnBoardingScreen());
  }

/*------------ Email and Password Sign in -----------------*/

  ///EmailAuthentication - Sign in

  ///EmailAuthentication - Sign up
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    }
    // on FirebaseAuthException catch (e) {
    //   throw ZFirebaseAuthException(e.code).message;
    // } on FirebaseException catch (e) {
    //   throw ZFirebaseException(e.code).message;
    // } on FormatException catch (_) {
    //   throw ZFormatException();
    // } on PlatformException catch (e) {
    //   ZPlatformException(e.code).message;
    // }
    catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  ///EmailVerification - Mail Verify

  ///ReAuthenticate -  ReAuthenticate user

  ///EmailAuthentication - Forget Password

/*------------ Federated identity and social Sign in -----------------*/

  ///GoogleAuthenticate - Google

  ///FacebookAuthenticate - Facebook

/*------------ ./end Federated identity and social Sign in -----------------*/

  ///LogoutUser - For any authentication

  ///DeleteUser - Remove user auth and firebase account
}
