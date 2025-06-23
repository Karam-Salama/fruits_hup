import 'package:flutter/material.dart';
import 'package:fruits_hup/core/widgets/custom_home_appBar.dart';

import '../../../../core/utils/app_strings.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(16),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: CustomAppBar(
                title: AppStrings.favorites,
                isVisibleTrailing: false,
                isVisibleLeading: false,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
          ],
        ),
      ),
    );
  }
}
