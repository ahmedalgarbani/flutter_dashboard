import 'package:dartz/dartz.dart';

import '../../../features/add_product/domain/entities/product_entity.dart';
import '../../error/failure.dart';
import 'products_repo.dart';

class ProductsRepoImpl extends ProductsRepo{
  @override
  Future<Either<Failure, void>> addProduct(ProductEntity addProductInputEntity) {
    // TODO: implement addProduct
    throw UnimplementedError();
  }

}