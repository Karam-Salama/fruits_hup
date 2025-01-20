import 'package:flutter/material.dart';
import 'package:fruits_hup/core/utils/app_strings.dart';

import 'step_item.dart';

class CheckoutSteps extends StatelessWidget {
  final int currentPageIndex;
  final PageController pageController;
  final ValueChanged<int> onTap;

  const CheckoutSteps({
    super.key,
    required this.currentPageIndex,
    required this.pageController,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps().length, (index) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              onTap(index);
            },
            child: StepItem(
              isActive: index <= currentPageIndex,
              index: (index + 1).toString(),
              text: getSteps()[index],
            ),
          ),
        );
      }),
    );
  }
}

List<String> getSteps() {
  return [
    AppStrings.shipping,
    AppStrings.address,
    AppStrings.payment,
    AppStrings.reviews,
  ];
}
