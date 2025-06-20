import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/cubits/product_cubit/product_cubit.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/app_text_styles.dart';
import '../../../core/widgets/custom_home_appBar.dart';
import '../../../core/widgets/custom_search_bar_widget.dart';
import 'search_results_bloc_builder.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 60)),
        SliverToBoxAdapter(
          child: CustomAppBar(
            title: AppStrings.searching,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios_new_rounded),
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
        SliverToBoxAdapter(
          child: CustomSearchBarWidget(
            onChanged: (value) {
              context.read<ProductCubit>().searchProducts(value);
            },
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              AppStrings.searchResults,
              style: AppTextStyle.Cairo400style13,
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SearchResultsBlocBuilder(),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }
}
