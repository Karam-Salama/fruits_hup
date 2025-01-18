import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hup/core/service/service_locator.dart';
import '../../../../core/cubits/product_cubit/product_cubit.dart';
import '../../../../core/repos/products_repos/product_repo.dart';
import '../widgets/custom_home_view_body.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(getIt.get<ProductRepo>()),
      child: const HomeViewBody(),
    );
  }
}
