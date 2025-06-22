import 'package:flutter/material.dart';

import '../widgets/payment_success_view_body.dart';

class PaymentSuccessView extends StatelessWidget {
  const PaymentSuccessView({super.key});
  static const String routeName = '/Payment-Success-View';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PaymentSuccessViewBody(),
    );
  }
}
