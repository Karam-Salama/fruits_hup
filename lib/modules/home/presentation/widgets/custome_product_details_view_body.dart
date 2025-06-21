import 'package:flutter/material.dart';
import 'package:fruits_hup/core/entites/product_entity.dart';
import 'custom_details_header_section.dart';
import 'custom_details_main_section.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: DetailsHeaderSection(productEntity: productEntity),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 24)),
        SliverToBoxAdapter(
          child: DetailsMainSection(productEntity: productEntity),
        ),
      ],
    );
  }
}
