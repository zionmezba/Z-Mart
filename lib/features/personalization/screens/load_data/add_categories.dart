import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:z_mart/common/widgets/appbar/appbar.dart';
import 'package:z_mart/data/services/firebase_storage_service.dart';
import 'package:z_mart/features/personalization/controllers/data_loader_controller.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart ';
import '../../../shop/models/category_model.dart';
import '../profile/widgets/profile_menu.dart';

class AddCategoriesScreen extends StatefulWidget {
  const AddCategoriesScreen({super.key});

  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoriesScreen> {
  final _formKey = GlobalKey<FormState>();
  final _storageService = ZFirebaseStorageService();
  final _titleController = TextEditingController();
  File? _imageFile;
  bool _isActive = true; // Default to active

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadCategory() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final title = _titleController.text;
    final imageUrl = await _uploadImage(_imageFile); // Upload image to storage
    final category = CategoryModel(
      id: '',
      name: title,
      image: imageUrl,
      isFeatured: _isActive,
    );

    try {
      await _storageService.uploadImageData(category);
      Navigator.pop(context); // Close screen after success
    } catch (error) {
      // Handle errors appropriately, e.g., show a snackbar
      print(error);
    }
  }

  Future<String> _uploadImage(File? imageFile) async {
    if (imageFile == null) return ''; // Handle no image case

    final storageRef = FirebaseStorage.instance
        .ref()
        .child('Categories/${DateTime.now().millisecondsSinceEpoch}.jpg');
    await storageRef.putFile(imageFile);
    final imageUrl = await storageRef.getDownloadURL();
    return imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DataLoaderController());

    return Scaffold(
        appBar: const ZAppBar(
          title: Text('Add Category'),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(ZSizes.defaultSpace),
            child: Column(
              children: [
                Column(
                  children: [
                    ///Category Picture
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          const Icon(Iconsax.add_circle),
                          TextButton(
                            onPressed: () => controller.uploadCategoryIcon(),
                            child: const Text('Select Category Icon'),
                          ),
                        ],
                      ),
                    ),

                    ///------Details-----
                    const SizedBox(
                      height: ZSizes.spaceBtwItems / 2,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: ZSizes.spaceBtwItems,
                    ),
                    const ZSectionHeading(
                      title: 'Profile Information',
                      showActionButton: false,
                    ),
                    const SizedBox(
                      height: ZSizes.spaceBtwItems,
                    ),
                    ZProfileMenu(
                      title: 'Name',
                      value: '',
                      onPressed: () {},
                    ),
                    ZProfileMenu(
                      title: 'Username',
                      value: '',
                      onPressed: () {},
                    ),

                    const SizedBox(
                      height: ZSizes.spaceBtwItems,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: ZSizes.spaceBtwItems,
                    ),

                    ZProfileMenu(
                      title: 'User ID',
                      value: '',
                      onPressed: () {},
                      icon: Iconsax.copy,
                    ),

                    ZProfileMenu(
                      title: 'Gender',
                      value: 'Male',
                      onPressed: () {},
                    ),
                    ZProfileMenu(
                      title: 'Date of Birth',
                      value: '23 Feb 1999',
                      onPressed: () {},
                    ),
                    const Divider(),
                    const SizedBox(
                      height: ZSizes.spaceBtwItems,
                    ),

                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Delete Account',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
