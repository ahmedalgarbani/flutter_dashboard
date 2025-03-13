import 'dart:convert';
import 'dart:io';

import 'package:flutter_dashboard/features/add_product/data/models/review_model.dart';
import 'package:flutter_dashboard/features/add_product/domain/entities/product_entity.dart';

class ProductModel {
  final String productName;
  final String productDescription;
  final String productCode;
  final num productPrice;
  final bool isFeatured;
  final File imageFile;
  String? imagePath;
  final bool isOrganic;
  final num expirationMonths;
  final int numberOfCalories;
  final int avgRating = 0;
  final int ratingCount = 0;
  final int unitAmount;
  final List<Map<String, dynamic>> reviews;

  ProductModel({
    this.isOrganic = false,
    required this.productName,
    required this.productDescription,
    required this.productCode,
    required this.productPrice,
    required this.isFeatured,
    required this.imageFile,
    required this.reviews,
    this.imagePath,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.unitAmount,
  });

  factory ProductModel.fromEntity(ProductEntity addProductEntity) {
    return ProductModel(
        reviews: addProductEntity.reviews
            .map((e) => ReviewModel.fromEntity(e).toMap())
            .toList(),
        productName: addProductEntity.productName,
        productDescription: addProductEntity.productDescription,
        productCode: addProductEntity.productCode,
        productPrice: addProductEntity.productPrice,
        isFeatured: addProductEntity.isFeatured,
        imageFile: File(addProductEntity.imagePath ?? ''),
        imagePath: addProductEntity.imagePath,
        expirationMonths: addProductEntity.expirationMonths,
        numberOfCalories: addProductEntity.numberOfCalories,
        isOrganic: addProductEntity.isOrganic,
        unitAmount: addProductEntity.unitAmount);
  }

  Map<String, dynamic> toMap() {
    return {
      'reviews': reviews,
      'productName': productName,
      'productDescription': productDescription,
      'productCode': productCode,
      'productPrice': productPrice,
      'isFeatured': isFeatured,
      'imagePath': imagePath,
      'expirationMonths': expirationMonths,
      'numberOfCalories': numberOfCalories,
      'isOrganic': isOrganic,
      'unitAmount': unitAmount,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      reviews: map['reviews'],
      productName: map['productName'] ?? '',
      productDescription: map['productDescription'] ?? '',
      productCode: map['productCode'] ?? '',
      productPrice: map['productPrice'] ?? 0,
      isFeatured: map['isFeatured'] ?? false,
      imageFile: File(map['imagePath'] ?? ''),
      imagePath: map['imagePath'],
      expirationMonths: map['expirationMonths'],
      numberOfCalories: map['numberOfCalories'],
      isOrganic: map['isOrganic'],
      unitAmount: map['unitAmount'],
    );
  }

  /// Convert object to JSON string
  String toJson() => json.encode(toMap());

  /// Create object from JSON string
  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));
}
