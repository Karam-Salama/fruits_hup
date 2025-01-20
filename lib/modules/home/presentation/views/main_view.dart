import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import '../widgets/main_view_body_bloc_consumer.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static const String routeName = '/home-View';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        body: const MainViewBodyBlocConsumer(),
      ),
    );
  }
}
