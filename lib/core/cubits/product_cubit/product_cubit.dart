import 'package:bloc/bloc.dart';
import 'package:fruits_hup/core/entites/product_entity.dart';
import 'package:meta/meta.dart';

import '../../repos/products_repos/product_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo productsRepo;
  ProductCubit(this.productsRepo) : super(ProductInitial());

  Future<void> getProducts() async {
    emit(ProductLoading());
    var result = await productsRepo.getProducts();
    result.fold(
      (failure) => emit(ProductFailure(errorMessage: failure.message)),
      (products) => emit(ProductSuccess(products: products)),
    );
  }

    Future<void> getBestSellingProducts() async {
    emit(ProductLoading());
    var result = await productsRepo.getBestSellingProducts();
    result.fold(
      (failure) => emit(ProductFailure(errorMessage: failure.message)),
      (products) => emit(ProductSuccess(products: products)),
    );
  }
}
