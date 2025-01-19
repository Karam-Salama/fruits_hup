// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fruits_hup/core/entites/product_entity.dart';

class CartItemEntity {
  final ProductEntity productEntity;
  int count;

  CartItemEntity({
    required this.productEntity,
    this.count = 0,
  });

  num calculateTotalPrice() {
    return productEntity.price * count;
  }

  num calculateTotalWeight() {
    return productEntity.unitAmount * count;
  }

  increaseCount() {
    count++;
  }

  decreaseCount() {
    if (count > 0) count--;
  }
}
