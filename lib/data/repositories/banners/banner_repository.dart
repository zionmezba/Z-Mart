import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:z_mart/features/shop/models/banner_model.dart';

import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class BannerRepository extends GetxController {
  final _db = FirebaseFirestore.instance;

  ///Get all order based on user
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final documentSnapshot = await _db
          .collection("Banners")
          .where('Active', isEqualTo: true)
          .get();
      final list = documentSnapshot.docs
          .map((document) => BannerModel.fromSnapShot(document))
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
}
