import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_home_appBar.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  static const String routeName = '/search-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
        ],
      ),
    );
  }
}
