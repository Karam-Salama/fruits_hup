import 'package:dartz/dartz.dart';
import 'package:fruits_hup/core/entites/product_entity.dart';

import '../../errors/failures.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts();
  Future<Either<Failure, List<ProductEntity>>> getProductsByName(String name);
}
