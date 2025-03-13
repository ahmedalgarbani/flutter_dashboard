import 'dart:io';

import 'package:flutter_dashboard/features/add_product/domain/entities/review_entity.dart';

class ProductEntity {
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
  final List<ReviewEntity> reviews;

  ProductEntity({
    this.isOrganic = false,
    required this.reviews,
    required this.productName,
    required this.productDescription,
    required this.productCode,
    required this.productPrice,
    required this.isFeatured,
    required this.imageFile,
    this.imagePath,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.unitAmount,
  });
}
