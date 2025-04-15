import 'package:bloc/bloc.dart';
import 'package:fruits_hup/core/entites/product_entity.dart';
import 'package:meta/meta.dart';

import '../../repos/products_repos/product_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productsRepo) : super(ProductInitial());

  final ProductRepo productsRepo;
  static int productsLength = 0;
  Future<void> getProducts() async {
    emit(ProductLoading());
    final result = await productsRepo.getProducts();
    result.fold(
      (failure) => emit(ProductFailure(errorMessage: failure.message)),
      (products) => emit(ProductSuccess(products: products)),
    );
  }

  Future<void> getBestSellingroducts() async {
    emit(ProductLoading());
    final result = await productsRepo.getBestSellingProducts();
    result.fold(
      (failure) => emit(ProductFailure(errorMessage: failure.message)),
      (products) {
        productsLength = products.length;
        emit(ProductSuccess(products: products));
      },
    );
  }
}
