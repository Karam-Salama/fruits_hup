part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductFailure extends ProductState {
  final String errorMessage;
  ProductFailure({required this.errorMessage});
}

final class ProductSuccess extends ProductState {
  final List<ProductEntity> products;
  ProductSuccess({required this.products});
}