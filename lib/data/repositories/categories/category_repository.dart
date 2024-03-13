import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:z_mart/features/shop/models/category_model.dart';

import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../services/firebase_storage_service.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  ///Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final documentSnapshot = await _db.collection("Categories").get();
      final list = documentSnapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
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

  ///get sub categories

  ///upload categories to firebase
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      final storage = Get.put(ZFirebaseStorageService());
      for (var category in categories) {
        final file = await storage.getImageDataFromAssets(category.image);

        //upload and get url
        final url =
            await storage.uploadImageData('Categories', file, category.name);

        //assign url to category image attributes
        category.image = url;

        //store cat in firebase
        await _db
            .collection('Categories')
            .doc(category.id)
            .set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw ZFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw ZPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
