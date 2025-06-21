import 'package:flutter/material.dart';
import 'package:fruits_hup/core/entites/product_entity.dart';
import 'package:fruits_hup/core/utils/app_assets.dart';
import 'package:fruits_hup/core/utils/app_text_styles.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_home_appBar.dart';
import '../../../../core/widgets/custom_network_image.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
            child: DetailsHeaderSection(productEntity: productEntity)),
        SliverToBoxAdapter(child: SizedBox(height: 24)),
        SliverToBoxAdapter(
            child: DetailsBodySection(productEntity: productEntity)),
      ],
    );
  }
}

class DetailsBodySection extends StatelessWidget {
  const DetailsBodySection({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            title: Text(
              productEntity.name,
              textAlign: TextAlign.right,
              style: AppTextStyle.Cairo600style13.copyWith(fontSize: 15),
            ),
            subtitle: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: '${productEntity.price}جنية',
                      style: AppTextStyle.Cairo600style10),
                  TextSpan(
                    text: AppStrings.kilo,
                    style: AppTextStyle.Cairo600style10,
                  ),
                ],
              ),
              textAlign: TextAlign.right,
            ),
            trailing: SizedBox(width: 100),
          )
        ],
      ),
    );
  }
}

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
            top: 60,
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
