import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/cubits/product_cubit/product_cubit.dart';
import '../../../../core/functions/get_dummy_product.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../../../../core/widgets/custom_no_result_widget.dart';
import 'our_products_list_view.dart';

class OurProductsBlocBuilderListView extends StatelessWidget {
  const OurProductsBlocBuilderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductSuccess) {
          if (state.products.isEmpty) {
            return const SliverToBoxAdapter(
              child: Center(child: NoResultsFoundView()),
            );
          }
          return OurProductsListView(products: state.products);
        } else if (state is ProductFailure) {
          return SliverToBoxAdapter(
              child: CustomErrorWidget(text: state.errorMessage));
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: OurProductsListView(products: getDummyProducts()),
          );
        }
      },
    );
  }
}
