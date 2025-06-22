import 'package:flutter/material.dart';

import '../../../../core/entites/product_entity.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/widgets/custom_home_appBar.dart';
import '../../../../core/widgets/custom_network_image.dart';

class DetailsHeaderSection extends StatelessWidget {
  const DetailsHeaderSection({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              Assets.assetsBgProductImage,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 40,
            right: 0,
            left: 0,
            child: CustomAppBar(
              title: productEntity.name,
              isVisibleTitle: false,
              isVisibleTrailing: false,
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios_new_rounded),
              ),
            ),
          ),
          Positioned(
            top: 135,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 221,
                height: 167,
                child: CustomNetworkImage(
                  imageUrl: productEntity.imageUrl!,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
