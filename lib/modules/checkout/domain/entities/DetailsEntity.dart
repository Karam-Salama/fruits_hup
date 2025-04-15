import 'order_entity.dart';

class DetailsEntity {
  String? subtotal;
  String? shipping;
  double? shippingDiscount;

  DetailsEntity({this.subtotal, this.shipping, this.shippingDiscount});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subtotal'] = this.subtotal;
    data['shipping'] = this.shipping;
    data['shipping_discount'] = this.shippingDiscount;
    return data;
  }

  factory DetailsEntity.fromEntity(OrderEntity order) {
    return DetailsEntity(
      subtotal: order.cartEntity.calculateTotalPrice().toString(),
      shipping: order.calculateShippingCost().toString(),
      shippingDiscount: order.calculateShippingDiscount(),
    );
  }
}
