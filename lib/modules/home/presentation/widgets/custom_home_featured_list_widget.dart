import 'package:flutter/material.dart';

import 'custom_home_featured_Item_widget.dart';

class CustomHomeFeaturedListWidget extends StatelessWidget {
  final int itemCount;

  const CustomHomeFeaturedListWidget({super.key, this.itemCount = 5});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = screenWidth * 0.95;

    return SizedBox(
      height: 185,
      child: ListView.builder(
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 8.0),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SizedBox(
              width: cardWidth,
              child: const CustomHomeFeaturedItem(),
            ),
          );
        },
      ),
    );
  }
}
