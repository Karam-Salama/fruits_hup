import 'package:bloc/bloc.dart';
import 'package:fruits_hup/core/entites/product_entity.dart';
import 'package:fruits_hup/modules/cart/domain/entities/cart_entity.dart';
import 'package:fruits_hup/modules/cart/domain/entities/cart_item_entity.dart';
import 'package:meta/meta.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntity cartEntity = CartEntity([]);
  void addProduct(ProductEntity productEntity) {
    var carItem = cartEntity.getCarItem(productEntity);
    if (cartEntity.isExist(productEntity)) {
      carItem.increaseCount();
    } else {
      cartEntity.addToCartItemsList(carItem);
    }
    emit(CartItemAdded());
  }

  void deleteCarItem(CartItemEntity cartItem) {
    cartEntity.removeaFromCartItemsList(cartItem);
    emit(CartItemRemoved());
  }
}
