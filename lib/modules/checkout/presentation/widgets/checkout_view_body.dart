// ignore_for_file: unused_element

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruits_hup/core/functions/build_error_bar.dart';
import 'package:fruits_hup/core/utils/app_colors.dart';
import 'package:fruits_hup/core/utils/app_keys.dart';
import 'package:fruits_hup/modules/checkout/domain/entities/payment_entity.dart';
import 'package:fruits_hup/modules/checkout/presentation/manager/cubit/add_order_cubit/add_order_cubit.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_btn.dart';
import '../../domain/entities/order_entity.dart';
import '../views/payment_success_view.dart';
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
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 30)),
          SliverToBoxAdapter(
            child: CustomCheckoutAppBar(
                title: getCurrentPageTitle(currentPageIndex)),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: CheckoutSteps(
              pageController: pageController,
              currentPageIndex: currentPageIndex,
              onTap: (index) {
                if (currentPageIndex == 0) {
                  pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                } else if (index == 1) {
                  var orderEntity = context.read<OrderEntity>();
                  if (orderEntity.payWithCash != null) {
                    pageController.animateToPage(index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  } else {
                    showBar(context, AppStrings.selectPaymentMethod);
                  }
                } else {
                  _handleAddressValidation();
                }
              },
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
          SliverToBoxAdapter(
            child: CheckoutStepsPageView(
              valueListenable: valueNotifier,
              pageController: pageController,
              formKey: _formKey,
            ),
          ),
          const SliverToBoxAdapter(
              child: SizedBox(height: 100)), // space for button
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<AddOrderCubit, AddOrderState>(
          builder: (context, state) {
            return state is AddOrderLoading
                ? Center(
                    child: CircularProgressIndicator(
                        color: AppColors.primaryColor),
                  )
                : CustomButton(
                    mainAxisAlignment: MainAxisAlignment.center,
                    onPressed: () {
                      if (currentPageIndex == 0) {
                        _handleShippingSectionValidation(context);
                      } else if (currentPageIndex == 1) {
                        _handleAddressValidation();
                      } else {
                        _handlePaymentProcess(context);
                      }
                    },
                    text: getNextButtonText(currentPageIndex),
                    style: AppTextStyle.Cairo700style16,
                    padding: 16,
                  );
          },
        ),
      ),
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

  void _handlePaymentProcess(BuildContext context) {
    var orderEntity = context.read<OrderEntity>();

    PaypalPaymentEntity paypalPaymentEntity =
        PaypalPaymentEntity.fromEntity(orderEntity);
    var addPOrderCubit = context.read<AddOrderCubit>();
    log(paypalPaymentEntity.toJson().toString());

    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: kPaypalClientId,
        secretKey: kPaypalSecretKey,
        transactions: [
          paypalPaymentEntity.toJson(),
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => PaymentSuccessView(),
            ),
          );
          addPOrderCubit.addOrder(order: orderEntity);
        },
        onError: (error) {
          log("onError: $error");
          showBar(context, AppStrings.paymentFailed);
          Navigator.pop(context);
        },
        onCancel: () {
          log('cancelled:');
          showBar(context, AppStrings.paymentCancelled);
          Navigator.pop(context);
        },
      ),
    ));
  }
}
