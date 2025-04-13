import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  CategoryModel({
    required this.name,
    required this.parentId,
    required this.image,
    required this.isFeatured,
  });

  String name;
  String image;
  String parentId;
  bool isFeatured;

  ///Empty cat model
  static CategoryModel empty() => CategoryModel(
       name: '', parentId: '', image: '', isFeatured: false);

  ///Convert model to json
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'ParentId': parentId,
      'Image': image,
      'IsFeatured': isFeatured,
    };
  }

  ///map json oriented document snapshot
  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return CategoryModel(
        name: data['Name'] ?? '',
        parentId: data['ParentId'] ?? '',
        image: data['Image'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
      );
    } else {
      return CategoryModel.empty();
    }
  }
}
