import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_btn.dart';
import 'checkout_steps.dart';
import 'checkout_steps_page_view.dart';
import 'custom_checkout_app_bar.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  ValueNotifier<AutovalidateMode> valueNotifier =
      ValueNotifier(AutovalidateMode.disabled);
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    valueNotifier.dispose();
    super.dispose();
  }

  int currentPageIndex = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 30)),
        //! AppBar
        SliverToBoxAdapter(
          child: CustomCheckoutAppBar(
              title: getCurrentPageTitle(currentPageIndex)),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        //! Checkout Steps
        SliverToBoxAdapter(
          child: CheckoutSteps(
            onTap: (value) {
              pageController.animateToPage(value,
                  duration: Duration(milliseconds: 300), curve: Curves.easeIn);
            },
            pageController: pageController,
            currentPageIndex: currentPageIndex,
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 32)),
        //! Checkout page view
        SliverToBoxAdapter(
          child: CheckoutStepsPageView(
            valueListenable: valueNotifier,
            pageController: pageController,
            formKey: _formKey,
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 32)),
        //! Checkout Next button
        SliverToBoxAdapter(
            child: CustomButton(
          mainAxisAlignment: MainAxisAlignment.center,
          onPressed: () {
            pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
            );
          },
          text: getNextButtonText(currentPageIndex),
          style: AppTextStyle.Cairo700style16,
          padding: 16,
        )),
      ],
    );
  }

  String getCurrentPageTitle(int currentPageIndex) {
    switch (currentPageIndex) {
      case 0:
        return AppStrings.shipping;
      case 1:
        return AppStrings.address;
      case 2:
        return AppStrings.payment;
      default:
        return AppStrings.shipping;
    }
  }

  String getNextButtonText(int currentPageIndex) {
    switch (currentPageIndex) {
      case 0:
        return AppStrings.next;
      case 1:
        return AppStrings.next;
      case 2:
        return AppStrings.paymentMethod;
      default:
        return AppStrings.next;
    }
  }
}
