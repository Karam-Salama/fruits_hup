import 'package:fruits_hup/modules/checkout/domain/entities/order_entity.dart';

import 'AmountEntity.dart';
import 'ItemList.dart';

class PaypalPaymentEntity {
  AmountEntity? amount;
  String? description;
  ItemListEntity? itemList;

  PaypalPaymentEntity({this.amount, this.description, this.itemList});

  factory PaypalPaymentEntity.fromEntity(OrderEntity entity) {
    return PaypalPaymentEntity(
      amount: AmountEntity.fromEntity(entity),
      description: "Payment Description",
      itemList: ItemListEntity.fromEntity(
        items: entity.cartEntity.cartItems,
      ),
    );
  }

  toJson() => {
        "amount": amount!.toJson(),
        "description": description,
        "itemList": itemList!.toJson()
      };
}
