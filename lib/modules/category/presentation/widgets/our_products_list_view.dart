import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../core/entites/product_entity.dart';
import '../../../home/presentation/views/product_details_view.dart';
import 'our_products_list_view_item.dart';

class OurProductsListView extends StatelessWidget {
  const OurProductsListView({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 100,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: products.length,
          separatorBuilder: (context, index) => const SizedBox(width: 16),
          itemBuilder: (context, index) {
            return OurProductsListViewItem(
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
      ),
    );
  }
}
