import 'package:fruits_hup/modules/cart/domain/entities/cart_entity.dart';

import 'shipping_address_entity.dart';

class OrderEntity {
  final CartEntity cartEntity;
  bool? payWithCash;
  final ShippingAddressEntity? shippingAddress;

  OrderEntity(
    this.cartEntity, {
    this.payWithCash,
    this.shippingAddress,
  });
}
