import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hup/core/utils/app_assets.dart';
import 'package:fruits_hup/core/utils/app_colors.dart';
import 'package:fruits_hup/modules/auth/presentation/views/signIn_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_btn.dart';
import '../../../../core/widgets/custom_dialog_widget.dart';
import '../../../auth/presentation/functions/build_custom_dialog.dart';
import '../cubit/setting_cubit.dart';
import '../cubit/setting_states.dart';

class LogoutBtnBlocConsumer extends StatelessWidget {
  const LogoutBtnBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    final settingCubit = BlocProvider.of<SettingCubit>(context);
    return BlocConsumer<SettingCubit, SettingStates>(
      listener: (context, state) {
        if (state is SignOutErrorState) {
          buildCustomDialog(
            context,
            CustomDialog(
              icon: Icons.error,
              message: state.message,
              textButton: "ok",
              onpressed: () => Navigator.pop(context),
            ),
          );
        } else if (state is SignOutSuccessState) {
          PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: SignInView(),
            withNavBar: false,
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 30),
          child: SizedBox(
            width: double.infinity,
            height: 48,
            child: state is SignOutLoadingState
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  )
                : CustomButton(
                    text: AppStrings.logout,
                    style: AppTextStyle.Cairo700style16,
                    mainAxisAlignment: MainAxisAlignment.center,
                    onPressed: () {
                      buildCustomDialog(
                        context,
                        CustomDialog(
                          leading: SvgPicture.asset(Assets.assetsImagesLogout),
                          message: "هل ترغب في تسجيل الخروج ؟",
                          textButton: "تأكيد",
                          textButton2: "لا ارغب",
                          onpressed: () => settingCubit.signOut(),
                          onpressed2: () => Navigator.pop(context),
                        ),
                      );
                    },
                  ),
          ),
        );
      },
    );
  }
}
