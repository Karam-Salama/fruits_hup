import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hup/core/entites/product_entity.dart';
import 'package:fruits_hup/core/service/service_locator.dart';

import '../../../../core/cubits/product_cubit/product_cubit.dart';
import '../widgets/custome_product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productEntity});
  static const String routeName = '/product-details-view';
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => getIt.get<ProductCubit>(),
        child: ProductDetailsViewBody(productEntity: productEntity),
      ),
    );
  }
}
