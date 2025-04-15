import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hup/core/service/service_locator.dart';
import 'package:fruits_hup/modules/cart/domain/entities/cart_entity.dart';
import 'package:fruits_hup/modules/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hup/modules/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruits_hup/modules/checkout/presentation/manager/cubit/add_order_cubit/add_order_cubit.dart';
import 'package:provider/provider.dart';
import '../../../../core/functions/get_user.dart';
import '../../../../core/repos/orders_repos/order_repo.dart';
import '../widgets/checkout_view_body.dart';

class CheckoutView extends StatefulWidget {
  final CartEntity cartEntity;
  const CheckoutView({super.key, required this.cartEntity});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late OrderEntity orderEntity;

  @override
  void initState() {
    orderEntity = OrderEntity(
      uId: getUser().uId,
      widget.cartEntity,
      shippingAddressEntity: ShippingAddressEntity(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(getIt<OrderRepo>()),
      child: Scaffold(
        body: Provider.value(
          value: orderEntity,
          child: CheckoutViewBody(),
        ),
      ),
    );
  }
}
