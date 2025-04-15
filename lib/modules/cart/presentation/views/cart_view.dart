import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hup/modules/cart/presentation/cubits/cart_item_cubit/cubit/cart_item_cubit.dart';

import '../widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) => CartItemCubit(),
      child: CartViewBody(),
    ));
  }
}
