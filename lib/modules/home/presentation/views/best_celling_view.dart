import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubits/product_cubit/product_cubit.dart';
import '../../../../core/repos/products_repos/product_repo.dart';
import '../../../../core/service/service_locator.dart';

import '../widgets/custom_best_celling_body.dart';

class BestCellingView extends StatelessWidget {
  const BestCellingView({super.key});

  static const String routeName = '/bestCelling-View';

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => ProductCubit(getIt.get<ProductRepo>()),
      child: const BestCellingBody(),
    );
  }
}
