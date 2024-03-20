import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import 'dart:io' show File;

class DataLoaderRepository extends GetxController {
  static DataLoaderRepository get instance => Get.find();

  ///Upload any image
  Future<String> uploadImage(String path, XFile pickedImage) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(pickedImage.name);
      await ref.putFile(File(pickedImage.path));
      final url = await ref.getDownloadURL();
      return url;
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
