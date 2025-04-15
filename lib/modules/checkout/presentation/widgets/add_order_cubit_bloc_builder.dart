import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hup/modules/checkout/presentation/manager/cubit/add_order_cubit/add_order_cubit.dart';

import '../../../../core/functions/build_error_bar.dart';

class AddOrderCubitBlocBuilder extends StatelessWidget {
  const AddOrderCubitBlocBuilder({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      listener: (context, state) {
        if (state is AddOrderSuccess) {
          showBar(context, 'Order added successfully');
        } else if (state is AddOrderFailure) {
          showBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return child;
      },
    );
  }
}
