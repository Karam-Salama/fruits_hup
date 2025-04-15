import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hup/core/utils/app_strings.dart';

import '../../../../core/cubits/product_cubit/product_cubit.dart';
import 'custom_best_celling_app_bar.dart';
import 'custom_best_selling_grid_view_bloc_builder.dart';

class BestCellingBody extends StatefulWidget {
  const BestCellingBody({super.key});

  @override
  State<BestCellingBody> createState() => _BestCellingBodyState();
}

class _BestCellingBodyState extends State<BestCellingBody> {
  @override
  void initState() {
    context.read<ProductCubit>().getBestSellingroducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 40)),
            SliverToBoxAdapter(
                child: CustomBestCellingAppBar(
                    title: AppStrings.mostSold, isVisible: true)),
            const SliverToBoxAdapter(child: SizedBox(height: 12)),
            BestSellingGridViewBlocBuilder(),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
          ],
        ),
      ),
    );
  }
}
