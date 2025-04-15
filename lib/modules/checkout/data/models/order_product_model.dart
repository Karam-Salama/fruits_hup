import '../../../cart/domain/entities/cart_item_entity.dart';

class OrderProductModel {
  final String name;
  final String code;
  final String imageUrl;
  final double price;
  final int quantity;

  OrderProductModel({
    required this.name,
    required this.code,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  factory OrderProductModel.fromEntity(
      {required CartItemEntity CartItemEntity}) {
    return OrderProductModel(
      name: CartItemEntity.productEntity.name,
      code: CartItemEntity.productEntity.code,
      imageUrl: CartItemEntity.productEntity.imageUrl!,
      price: CartItemEntity.productEntity.price.toDouble(),
      quantity: CartItemEntity.quantity,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
    };
  }
}
