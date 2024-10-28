import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_best_celling_grid_view_widget.dart';
import 'custom_best_celling_header_text_widget.dart';
import 'custom_home_app_bar_widget.dart';
import '../../../../core/widgets/custom_search_bar_widget.dart';
import 'custom_home_featured_list_widget.dart';

class HomeViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 60)),
          const SliverToBoxAdapter(child: CustomHomeAppBarWidget()),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          const SliverToBoxAdapter(child: CustomSearchBarWidget()),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          const SliverToBoxAdapter(child: CustomHomeFeaturedListWidget()),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverToBoxAdapter(child: BestCellingHeaderText()),
          const SliverToBoxAdapter(child: SizedBox(height: 8)),
          BestCellingGridView(),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}
