import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/build_error_bar.dart';
import '../../../cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'custom_home_nav_bar_widget.dart';

class MainViewBodyBlocConsumer extends StatelessWidget {
  const MainViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartItemAdded) {
          showBar(context, 'تمت العملية بنجاح');
        }
        if (state is CartItemRemoved) {
          showBar(context, 'تم حذف العنصر بنجاح');
        }
      },
      child: HomeNavBarWidget(),
    );
  }
}
