import 'dart:io';

class ProductEntity  {
  final String productNmae;
  final String productDescription;
  final String productCode;
  final num productPrice;
  final bool isFeatured;
  final File imageFile;
  final String? imagePath;

  ProductEntity ({
    required this.productNmae,
    required this.productDescription,
    required this.productCode,
    required this.productPrice,
    required this.isFeatured,
    required this.imageFile,
     this.imagePath,
  });
}
