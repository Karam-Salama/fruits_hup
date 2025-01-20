import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hup/core/utils/app_strings.dart';
import 'package:fruits_hup/core/widgets/custom_divider.dart';
import '../../../../core/widgets/custom_cart_app_bar.dart';
import '../cubits/cart_cubit/cart_cubit.dart';
import 'cart_items_list.dart';
import 'custom_cart_button.dart';
import 'custom_cart_header.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 30)),
          SliverToBoxAdapter(child: CustomCartAppBar(title: AppStrings.cart)),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          const SliverToBoxAdapter(child: CustomCartHeader()),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverToBoxAdapter(
            child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                ? const SizedBox()
                : const CustomDivider(),
          ),
          CartItemsList(
              cartItems: context.watch<CartCubit>().cartEntity.cartItems),
          SliverToBoxAdapter(
            child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                ? const SizedBox()
                : const CustomDivider(),
          ),
        ],
      ),
      Positioned(
        left: 16,
        right: 16,
        bottom: MediaQuery.sizeOf(context).height * .07,
        child: CustomCartButton(),
      )
    ]);
  }
}
