import 'package:flutter/material.dart';
import 'package:fruits_hup/core/entites/product_entity.dart';

import 'custom_fruit_card_item_widget.dart';

class BestCellingGridView extends StatelessWidget {
  const BestCellingGridView({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 6,
          childAspectRatio: 160 / 200,
        ),
        itemBuilder: (context, index) {
          // var product = products[index];
          return const FruitCardItem();
        },
        itemCount: products.length,
      ),
    );
  }
}
