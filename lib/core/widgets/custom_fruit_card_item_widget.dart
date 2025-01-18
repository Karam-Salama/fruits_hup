import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hup/core/entites/product_entity.dart';
import 'package:fruits_hup/core/utils/app_strings.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class FruitCardItem extends StatelessWidget {
  const FruitCardItem({super.key, required this.productEntity});

  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfff3f5f7),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Color(0x19000000),
            spreadRadius: 0,
            blurRadius: 25,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_outline,
                )),
          ),
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(height: 20),
                productEntity.imageUrl != null
                    ? Flexible(
                        child: Image.network(productEntity.imageUrl!),
                      )
                    : Container(
                        color: Colors.grey,
                        height: 100,
                        width: 100,
                      ),
                const SizedBox(height: 24),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
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
                  trailing: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(Assets.assetsIconsAdd),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
