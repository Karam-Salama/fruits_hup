import 'package:flutter/material.dart';
import 'package:fruits_hup/modules/cart/domain/entities/cart_item_entity.dart';

import '../../../../core/widgets/custom_divider.dart';
import 'cart_item.dart';

class CartItemsList extends StatelessWidget {
  CartItemsList({super.key, required this.cartItems});
  List<CartItemEntity> cartItems;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: cartItems.length,
      separatorBuilder: (context, index) => CustomDivider(),
      itemBuilder: (context, index) => CartItem(
        cartItemEntity: cartItems[index],
      ),
    );
  }
}
