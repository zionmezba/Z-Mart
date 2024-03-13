import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel({
    required this.id,
    required this.name,
    this.parentId = "",
    required this.image,
    required this.isFeatured,
  });

  ///Empty Helper Function
  static CategoryModel empty() => CategoryModel(
      id: '', name: '', parentId: '', image: '', isFeatured: false);

  ///Convert model to json
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
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
        id: document.id,
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
