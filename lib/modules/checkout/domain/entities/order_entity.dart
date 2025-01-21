import '../../../cart/domain/entities/cart_item_entity.dart';
import 'shipping_address_entity.dart';

class OrderEntity {
  final List<CartItemEntity> cartItems;
  final bool payWithCash;
  final ShippingAddressEntity shippingAddress;

  OrderEntity(
    this.cartItems,
    this.payWithCash,
    this.shippingAddress,
  );
}
