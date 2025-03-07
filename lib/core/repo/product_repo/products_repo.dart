import 'package:dartz/dartz.dart';

import '../../../features/add_product/domain/entities/product_entity.dart';
import '../../error/failure.dart';

abstract class ProductsRepo {
  Future<Either<Failure, void>> addProduct(ProductEntity addProductInputEntity);
}
