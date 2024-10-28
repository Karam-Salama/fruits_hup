import 'package:flutter/material.dart';

import 'custom_fruit_card_item_widget.dart';

class BestCellingGridView extends StatelessWidget {
  const BestCellingGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 6,
        childAspectRatio: 163 / 170,
      ),
      itemBuilder: (context, index) => const FruitCardItem(),
      itemCount: 8,
    );
  }
}
