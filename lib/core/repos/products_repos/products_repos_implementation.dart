import 'package:dartz/dartz.dart';

import 'package:fruits_hup/core/entites/product_entity.dart';

import 'package:fruits_hup/core/errors/failures.dart';
import 'package:fruits_hup/core/models/product_model.dart';
import 'package:fruits_hup/core/utils/app_Backend_Endpoints.dart';

import '../../service/database_service.dart';
import 'product_repo.dart';

class ProductReposImplementation implements ProductRepo {
  final DatabaseService databaseService;

  ProductReposImplementation(this.databaseService);
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data = await databaseService.getData(
          path: BackendEndpoints.getProducts,
          query: {
            'limit': 10,
            'orderBy': 'sellingCount',
            'descending': true
          }) as List<Map<String, dynamic>>;

      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure('Failed to get products'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data = await databaseService.getData(
          path: BackendEndpoints.getProducts) as List<Map<String, dynamic>>;

      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure('Failed to get products'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsByName(
      String name) async {
    try {
      var allProducts = await databaseService.getData(
          path: BackendEndpoints.getProducts) as List<Map<String, dynamic>>;

      // Filter locally if backend doesn't support search
      final filteredProducts = allProducts
          .where((product) => product['name']
              .toString()
              .toLowerCase()
              .contains(name.toLowerCase()))
          .toList();

      if (filteredProducts.isEmpty) {
        return right([]);
      }

      List<ProductEntity> products = filteredProducts
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();

      return right(products);
    } catch (e) {
      return left(ServerFailure('Failed to get products by name'));
    }
  }
}
