import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/widgets/loaders/loaders.dart';
import '../../../data/repositories/data_loader/data_loader_repository.dart';

class DataLoaderController extends GetxController{
  static DataLoaderController get instance => Get.find();

  final dataLoaderRepository = Get.put(DataLoaderRepository());
  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final imageUploading = false.obs;
  final profileLoading = false.obs;
  // Rx<UserModel> user = UserModel.empty().obs;
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  ///Upload Profile Image
  void uploadCategoryIcon() async {
    try {
      final pickedImage = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (pickedImage != null) {
        imageUploading.value = true;
        final imageUrl = await dataLoaderRepository.uploadImage(
            'Products/Images', pickedImage);

        //Update user record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        // await dataLoaderRepository.updateSingleField(json);
        // user.value.profilePicture = imageUrl;
        // user.refresh();
        ZLoaders.successSnackBar(
            title: 'Success',
            message: 'Your profile picture has been updated!');
      }
    } catch (e) {
      ZLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      imageUploading.value = false;
    }
  }
}