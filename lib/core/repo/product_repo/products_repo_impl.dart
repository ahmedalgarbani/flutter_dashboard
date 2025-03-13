import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_dashboard/core/services/data_service.dart';
import 'package:flutter_dashboard/features/add_product/data/models/product_model.dart';

import '../../../features/add_product/domain/entities/product_entity.dart';
import '../../error/failure.dart';
import 'products_repo.dart';

class ProductsRepoImpl extends ProductsRepo {
  final DataServic _dataServic;

  ProductsRepoImpl(this._dataServic);

  @override
  Future<Either<Failure, void>> addProduct(
      ProductEntity addProductInputEntity) async {
    try {
      print(ProductModel.fromEntity(addProductInputEntity).toMap());
      print(ProductModel.fromEntity(addProductInputEntity).toMap());
      log(ProductModel.fromEntity(addProductInputEntity).toMap().toString());
      await _dataServic.addData(
          path: "Products",
          data: ProductModel.fromEntity(addProductInputEntity).toMap());
      return Right(null);
    } on Exception catch (e) {
      return Left(
        ServerFailure(message: "failes to add product"),
      );
    }
  }
}
