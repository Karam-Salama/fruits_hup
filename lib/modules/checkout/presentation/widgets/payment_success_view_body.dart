import 'package:flutter/material.dart';
import 'package:fruits_hup/core/utils/app_assets.dart';
import 'package:fruits_hup/core/utils/app_strings.dart';
import 'package:fruits_hup/core/widgets/custom_btn.dart';
import 'package:fruits_hup/modules/home/presentation/views/main_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../core/utils/app_text_styles.dart';

class PaymentSuccessViewBody extends StatelessWidget {
  const PaymentSuccessViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 107,
              width: 154,
              child: Image.asset(
                Assets.assetsImagesPaymentSuccess,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              AppStrings.paymentSuccess,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 30),
        child: CustomButton(
          mainAxisAlignment: MainAxisAlignment.center,
          onPressed: () {
            PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: MainView(),
              withNavBar: true,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          },
          text: AppStrings.goToHome,
          style: AppTextStyle.Cairo700style16,
          padding: 16,
        ),
      ),
    );
  }
}
