import 'package:flutter/material.dart';
import 'package:fruits_hup/modules/cart/domain/entities/cart_entity.dart';
import 'package:fruits_hup/modules/checkout/domain/entities/order_entity.dart';
import 'package:provider/provider.dart';
import '../widgets/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  final CartEntity cartEntity;
  const CheckoutView({super.key, required this.cartEntity});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.value(
        value: OrderEntity(cartEntity),
        child: CheckoutViewBody(),
      ),
    );
  }
}
