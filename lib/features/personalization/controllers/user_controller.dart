import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:z_mart/common/widgets/loaders/loaders.dart';
import 'package:z_mart/data/repositories/user/user_repository.dart';
import 'package:z_mart/features/personalization/models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepository = Get.put(UserRepository());

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        final nameParts = UserModel.nameParts(
            userCredential.user!.displayName ?? '');
        final username = UserModel.generateUsername(
            userCredential.user!.displayName ?? '');

        //Map data
        final user = UserModel(
          id: userCredential.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1
              ? nameParts.sublist(1).join(' ')
              : '',
          username: username,
          email: userCredential.user!.email ?? '',
          phoneNumber: userCredential.user!.phoneNumber ?? '',
          profilePicture: userCredential.user!.photoURL ?? '',);

        //save data
        await userRepository.saveUserRecord(user);

    }
    } catch (e) {
    ZLoaders.warningSnackBar(title: 'Data not saved',
    message: 'Something went wrong while saving your data');
    }
  }
}