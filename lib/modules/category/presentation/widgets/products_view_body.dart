import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/cubits/product_cubit/product_cubit.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_search_bar_widget.dart';
import '../../../home/presentation/widgets/custom_best_celling_app_bar.dart';
import '../../../home/presentation/widgets/custom_best_celling_header_text_widget.dart';
import '../../../home/presentation/widgets/custom_best_selling_grid_view_bloc_builder.dart';
import 'our_products_list_view_bloc_builder.dart';
import 'products_header.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    context.read<ProductCubit>().getProducts();
    context.read<ProductCubit>().getBestSellingroducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 40)),
        SliverToBoxAdapter(
          child: CustomBestCellingAppBar(
            title: AppStrings.products,
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: CustomSearchBarWidget(
            onChanged: (value) {
              context.read<ProductCubit>().searchProducts(value);
            },
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(child: ProductsHeader()),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        OurProductsBlocBuilderListView(),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(child: BestCellingHeaderText()),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        BestSellingGridViewBlocBuilder(),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }
}
