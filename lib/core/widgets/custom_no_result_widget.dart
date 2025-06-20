import 'package:flutter/material.dart';

import '../utils/app_assets.dart';

class NoResultsFoundView extends StatelessWidget {
  const NoResultsFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Image.asset(
          Assets.assetsNoResultsFoundImage,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
