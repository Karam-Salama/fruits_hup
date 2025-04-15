import 'package:fruits_hup/core/functions/get_currency.dart';
import 'package:fruits_hup/modules/cart/domain/entities/cart_item_entity.dart';

class ItemsEnitity {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  ItemsEnitity({this.name, this.quantity, this.price, this.currency});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['currency'] = this.currency;
    return data;
  }

  factory ItemsEnitity.fromEntity(CartItemEntity CartItemEntity) {
    return ItemsEnitity(
      name: CartItemEntity.productEntity.name,
      quantity: CartItemEntity.quantity,
      price: CartItemEntity.productEntity.price.toString(),
      currency: getCurrency(),
    );
  }
}
