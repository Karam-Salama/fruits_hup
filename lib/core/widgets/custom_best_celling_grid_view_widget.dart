import 'package:flutter/material.dart';
import 'package:fruits_hup/core/entites/product_entity.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../modules/home/presentation/views/product_details_view.dart';
import 'custom_fruit_card_item_widget.dart';

class BestCellingGridView extends StatelessWidget {
  const BestCellingGridView({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverGrid.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 163 / 214,
          mainAxisSpacing: 8,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          return FruitCardItem(
            productEntity: products[index],
            onTap: () {
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: ProductDetailsView(productEntity: products[index]),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
          );
        },
      ),
    );
  }
}
