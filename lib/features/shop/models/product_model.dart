import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:z_mart/features/shop/models/product_attribute_model.dart';
import 'package:z_mart/features/shop/models/product_variation_model.dart';

import 'brand_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  ProductModel({
    required this.id,
    required this.stock,
    required this.title,
    required this.price,
    required this.thumbnail,
    required this.productType,
    this.sku,
    this.brand,
    this.date,
    this.images,
    this.description,
    this.salePrice = 0.0,
    this.isFeatured,
    this.categoryId,
    this.productAttributes,
    this.productVariations,
  });

  static ProductModel empty() => ProductModel(
      id: '', stock: 0, title: '', price: 0, thumbnail: '', productType: '');

  toJson() {
    return {
      'Id': id,
      'Stock': stock,
      'Title': title,
      'Description': description,
      'Price': price,
      'Thumbnail': thumbnail,
      'ProductType': productType,
      'SKU': sku,
      'Brand': brand!.toJson(),
      'Date': date,
      'Images': images ?? [],
      'SalePrice': salePrice,
      'IsFeatured': isFeatured,
      'CategoryId': categoryId,
      'ProductAttributes': productAttributes != null
          ? productAttributes!.map((e) => e.toJson()).toList()
          : [],
      'ProductVariations': productVariations != null
          ? productAttributes!.map((e) => e.toJson()).toList()
          : [],
    };
  }

  ///map json oriented document snapshot
  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ProductModel(
      id: document.id,
      stock: data['Stock'] ?? 0,
      title: data['Title'],
      price: double.parse((data['Price'] ?? 0.0).toString()),
      thumbnail: data['Thumbnail'] ?? '',
      description: data['Description'] ?? '',
      productType: data['ProductType'] ?? '',
      sku: data['SKU'],
      brand: BrandModel.fromJson(data['Brand']),
      date: data['Date'],
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      isFeatured: data['IsFeatured'] ?? false,
      categoryId: data['CategoryId'] ?? '',
      productAttributes: (data['ProductAttributes'] as List<dynamic>)
          .map((e) => ProductAttributeModel.fromJson(e))
          .toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>)
          .map((e) => ProductVariationModel.fromJson(e))
          .toList(),
    );
  }

  ///map json oriented document snapshot
  factory ProductModel.fromQuerySnapshot(
      QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return ProductModel(
      id: document.id,
      stock: data['Stock'] ?? 0,
      title: data['Title'],
      price: double.parse((data['Price'] ?? 0.0).toString()),
      thumbnail: data['Thumbnail'] ?? '',
      description: data['Description'] ?? '',
      productType: data['ProductType'] ?? '',
      sku: data['SKU'],
      brand: BrandModel.fromJson(data['Brand']),
      date: data['Date'],
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      isFeatured: data['IsFeatured'] ?? false,
      categoryId: data['CategoryId'] ?? '',
      productAttributes: (data['ProductAttributes'] as List<dynamic>)
          .map((e) => ProductAttributeModel.fromJson(e))
          .toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>)
          .map((e) => ProductVariationModel.fromJson(e))
          .toList(),
    );
  }
}
