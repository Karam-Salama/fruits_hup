import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_divider.dart';
import 'cart_item.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: 6,
      separatorBuilder: (context, index) => CustomDivider(),
      itemBuilder: (context, index) => const CartItem(),
    );
  }
}
