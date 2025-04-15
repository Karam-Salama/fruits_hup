import 'package:fruits_hup/modules/cart/domain/entities/cart_item_entity.dart';

import 'ItemsEntity.dart';

class ItemListEntity {
  List<ItemsEnitity>? items;

  ItemListEntity({this.items});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  factory ItemListEntity.fromEntity({required List<CartItemEntity> items}) {
    return ItemListEntity(
      items: items.map((e) => ItemsEnitity.fromEntity(e)).toList(),
    );
  }
}
