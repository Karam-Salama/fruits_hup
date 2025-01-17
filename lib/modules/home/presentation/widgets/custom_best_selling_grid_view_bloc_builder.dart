import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hup/core/functions/get_dummy_product.dart';

import '../../../../core/cubits/product_cubit/product_cubit.dart';
import '../../../../core/widgets/custom_best_celling_grid_view_widget.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestSellingGridViewBlocBuilder extends StatelessWidget {
  const BestSellingGridViewBlocBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductSuccess) {
          return BestCellingGridView(products: state.products);
        } else if (state is ProductFailure) {
          return SliverToBoxAdapter(child: CustomErrorWidget(text: state.errorMessage));
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: BestCellingGridView(products: getDummyProducts()),
          );
        }
      },
    );
  }
}
