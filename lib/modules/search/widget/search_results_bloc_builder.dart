import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/cubits/product_cubit/product_cubit.dart';
import '../../../core/functions/get_dummy_product.dart';
import '../../../core/widgets/custom_error_widget.dart';
import '../../../core/widgets/custom_no_result_widget.dart';
import 'filtered_products_grid_view.dart';

class SearchResultsBlocBuilder extends StatelessWidget {
  const SearchResultsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return Skeletonizer.sliver(
            enabled: true,
            child: FilteredProductsGridView(products: getDummyProducts()),
          );
        } else if (state is ProductFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(text: state.errorMessage),
          );
        } else if (state is ProductSuccess) {
          if (state.products.isEmpty) {
            return const SliverToBoxAdapter(
              child: Center(child: NoResultsFoundView()),
            );
          }
          return FilteredProductsGridView(products: state.products);
        } else {
          // Initial state - show nothing or a prompt to search
          return const SliverToBoxAdapter(
            child: Center(
              child: Text('Start typing to search for products'),
            ),
          );
        }
      },
    );
  }
}
