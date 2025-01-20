import 'package:flutter/material.dart';
import 'package:fruits_hup/core/widgets/custom_home_appBar.dart';

import '../../../../core/utils/app_strings.dart';
import 'custom_checkout_button.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 30)),
        SliverToBoxAdapter(
            child: CustomCheckoutButton(title: AppStrings.shipping)),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        const SliverToBoxAdapter(child: CustomShippingProgressBar()),
        const SliverToBoxAdapter(child: SizedBox(height: 32)),
      ],
    );
  }
}

class CustomShippingProgressBar extends StatelessWidget {
  const CustomShippingProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
