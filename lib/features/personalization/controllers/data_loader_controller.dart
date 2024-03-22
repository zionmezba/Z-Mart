import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:z_mart/features/personalization/screens/load_data/load_data.dart';
import 'package:z_mart/features/shop/models/category_model.dart';

import '../../../common/widgets/loaders/loaders.dart';
import '../../../data/repositories/data_loader/data_loader_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';

class DataLoaderController extends GetxController {
  static DataLoaderController get instance => Get.find();

  final dataLoaderRepository = Get.put(DataLoaderRepository());
  final isSelected = false.obs;
  final categoryName = TextEditingController();
  final isFeatured = false.obs;
  final parentId = '/shop';
  XFile? pickedImage;

  Rx<CategoryModel> category = CategoryModel.empty().obs;
  GlobalKey<FormState> categoryFormKey = GlobalKey<FormState>();

  ///Upload cat Image
  void selectCategoryIcon() async {
    try {
      pickedImage = (await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 65,
          maxHeight: 150,
          maxWidth: 150))!;
      isSelected.value = true;
    } catch (e) {
      ZLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {}
  }

  ///Sign-in
  Future<void> saveCategory() async {
    try {
      //Start Loading
      ZFullScreenLoader.openLoadingDialogue(
          'Saving Category...', ZImages.docerAnimation);

      //Check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        ZFullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if (!categoryFormKey.currentState!.validate()) {
        ZFullScreenLoader.stopLoading();
        return;
      }
      final imageName = categoryName.value.text;
      final url = await dataLoaderRepository.uploadImage(
          'Categories/$imageName', pickedImage!);

      final category = CategoryModel(name: imageName, parentId: parentId, image: url, isFeatured: isFeatured.value);

      await dataLoaderRepository.saveCategory(category);

      ZFullScreenLoader.stopLoading();
      ZLoaders.successSnackBar(
          title: 'Success', message: 'Your category has been added!');

      //Redirect
      Get.off(const LoadDataScreen());
    } catch (e) {
      //remove loader
      ZFullScreenLoader.stopLoading();
      ZLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
