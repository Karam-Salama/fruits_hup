import 'package:flutter/material.dart';

import 'order_summry_widget.dart';
import 'shipping_address_widget.dart';

class PaymentSection extends StatelessWidget {
  final PageController pageController;
  const PaymentSection({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 24),
      const OrderSummryWidget(),
      const SizedBox(height: 16),
      ShippingAddressWidget( pageController: pageController)
    ]);
  }
}
