import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'shipping_section.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({
    super.key,
    required this.pageController,
    required this.formKey,
    required this.valueListenable,
  });

  final GlobalKey<FormState> formKey;
  final PageController pageController;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        height: 300,
        child: PageView.builder(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: getPages().length,
          itemBuilder: (context, index) {
            return getPages()[index];
          },
        ),
      ),
    );
  }

  List<Widget> getPages() {
    return [
      const ShippingSection(),
      const ShippingSection(),
      const ShippingSection(),
      const ShippingSection(),
    ];
  }
}
