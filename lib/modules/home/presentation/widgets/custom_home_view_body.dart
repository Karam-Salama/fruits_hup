import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../../../core/cubits/product_cubit/product_cubit.dart';
import '../../../../core/widgets/custom_search_bar_widget.dart';
import '../../../search/view/search_view.dart';
import 'custom_best_celling_header_text_widget.dart';
import 'custom_best_selling_grid_view_bloc_builder.dart';
import 'custom_home_app_bar_widget.dart';
import 'custom_home_featured_list_widget.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<ProductCubit>().getBestSellingroducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 30)),
        const SliverToBoxAdapter(child: CustomHomeAppBarWidget()),
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
        SliverToBoxAdapter(child: CustomSearchBarWidget(
          onTap: () {
            PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: SearchView(),
              withNavBar: true,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          },
        )),
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
        const SliverToBoxAdapter(child: CustomHomeFeaturedListWidget()),
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
        SliverToBoxAdapter(child: BestCellingHeaderText()),
        const SliverToBoxAdapter(child: SizedBox(height: 8)),
        BestSellingGridViewBlocBuilder(),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }
}
