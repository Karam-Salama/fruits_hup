import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hup/core/utils/app_strings.dart';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class FruitCardItem extends StatelessWidget {
  const FruitCardItem({super.key});

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
            top: 15,
            right: 15,
            child: InkWell(
              onTap: () {},
              child: SvgPicture.asset(Assets.assetsIconsHeart),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  width: 100,
                  height: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Assets.assetsIconsWatermelon),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                ListTile(
                  title: Text(
                    AppStrings.watermelon,
                    style: AppTextStyle.Cairo600style13.copyWith(fontSize: 15),
                  ),
                  subtitle: Text(
                    AppStrings.watermelonPrice,
                    style: AppTextStyle.Cairo600style13.copyWith(
                      color: const Color(0xffF4A91F),
                      fontSize: 10,
                    ),
                  ),
                  trailing: Transform.translate(
                    offset: const Offset(-10, 0),
                    child: InkWell(
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
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
