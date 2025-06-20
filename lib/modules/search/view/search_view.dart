import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/cubits/product_cubit/product_cubit.dart';
import '../../../core/repos/products_repos/product_repo.dart';
import '../../../core/service/service_locator.dart';
import '../widget/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  static const String routeName = '/search-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProductCubit(getIt.get<ProductRepo>()),
        child: const SearchViewBody(),
      ),
    );
  }
}
