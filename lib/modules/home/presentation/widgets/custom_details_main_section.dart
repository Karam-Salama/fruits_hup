import 'package:flutter/material.dart';
import 'package:fruits_hup/core/widgets/custom_btn.dart';
import '../../../../core/entites/product_entity.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import 'custom_details_first_row_of_properties.dart';
import 'custom_details_header_of_main_section.dart';
import 'custom_details_second_row_of_properties.dart';

class DetailsMainSection extends StatelessWidget {
  const DetailsMainSection({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDetailsHeaderOfMainSection(productEntity: productEntity),
            const SizedBox(height: 8),
            Text(
              productEntity.description,
              style: AppTextStyle.Cairo400style13,
            ),
            const SizedBox(height: 16),
            CustomDetailsFirstRowOfProperties(productEntity: productEntity),
            const SizedBox(height: 16),
            CustomDetailsSecondRowOfProperties(productEntity: productEntity),
            const SizedBox(height: 24),
            CustomButton(
              text: AppStrings.addToCart,
              onPressed: () {},
              style: AppTextStyle.Cairo700style16,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
