import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hup/core/functions/build_error_bar.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_btn.dart';
import '../../domain/entities/order_entity.dart';
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
  ValueNotifier<AutovalidateMode> valueNotifier = ValueNotifier(AutovalidateMode.disabled);
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
    return Stack(children: [
      CustomScrollView(
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
                if (context.read<OrderEntity>().payWithCash != null) {
                  pageController.animateToPage(value,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                } else {
                  showBar(context, AppStrings.selectPaymentMethod);
                }
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
        ],
      ),
      //! Checkout Next button
      Positioned(
        left: 16,
        right: 16,
        bottom: MediaQuery.sizeOf(context).height * .07,
        child: CustomButton(
          mainAxisAlignment: MainAxisAlignment.center,
          onPressed: () {
            if (currentPageIndex == 0) {
              _handleShippingSectionValidation(context);
            } else if (currentPageIndex == 1) {
              _handleAddressValidation();
            }
          },
          text: getNextButtonText(currentPageIndex),
          style: AppTextStyle.Cairo700style16,
          padding: 16,
        ),
      )
    ]);
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

  void _handleShippingSectionValidation(BuildContext context) {
    if (context.read<OrderEntity>().payWithCash != null) {
      pageController.animateToPage(
        currentPageIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      showBar(context, AppStrings.selectPaymentMethod);
    }
  }

  void _handleAddressValidation() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      pageController.animateToPage(
        currentPageIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }

  void _processPayment(BuildContext context) {}
}
