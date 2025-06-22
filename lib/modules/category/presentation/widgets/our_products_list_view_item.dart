import 'package:flutter/material.dart';

import '../../../../core/entites/product_entity.dart';

class OurProductsListViewItem extends StatelessWidget {
  const OurProductsListViewItem({
    required this.productEntity,
    required this.onTap,
  });

  final ProductEntity productEntity;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              image: DecorationImage(
                image: NetworkImage(productEntity.imageUrl!),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            productEntity.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
