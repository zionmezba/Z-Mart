import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../features/personalization/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
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
}
